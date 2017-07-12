
import Foundation

public struct VideoJSONParser {
    
    public var videoDataItems: [VideoDataItem] = [VideoDataItem]()
    
    public init? (from data: Data) {
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            if let linksDictionary = json as? [String: Any] {
                if let videoItemArray = linksDictionary["_links"] as? [[String: Any]] {
                    for videoItem in videoItemArray {
                        
                        if let videoDataItem = videoItemToVideoDataItem(videoItem) {
                            videoDataItems.append(videoDataItem)
                        }
                    
                    }
                } else {
                    return nil
                }
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
}


private func videoItemToVideoDataItem(_ videoItem: [String: Any]) -> VideoDataItem? {
    var videoDataItem: VideoDataItem? = nil
    
    //Only add if title exists
    if let title = videoItem["title"] as? String {
        let synopsis = videoItem["synopsis"] as? String ?? ""
        let broadcastChannel = videoItem["broadcastChannelValue"] as? String ?? ""
        
        
        var imageSizesAndURLs = [ImageURLDetails]()
        if let imagesArray = videoItem["images"] as? [[String: Any]] {
            for image in imagesArray {
                if let width = image["width"] as? Int {
                    let height = image["height"] as? Int ?? 0
                    let url = image["url"] as? String ?? ""
                    let imageURLDetails = ImageURLDetails(url: url, resolution: URLImageResolution(horizontalPixels: height, verticalPixels: width))
                    imageSizesAndURLs.append(imageURLDetails)
                }
            }
        }
        let videoDataItemStruct = VideoDataItemStruct(title: title,
                                                 synopsis: synopsis,
                                                 broadcastChannel: broadcastChannel,
                                                 imageURLs: imageSizesAndURLs)
        videoDataItem = videoDataItemStruct as VideoDataItem
    }
    

    return videoDataItem
}

