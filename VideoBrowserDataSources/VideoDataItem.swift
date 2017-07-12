

public protocol VideoDataItem {
    var title: String {get}
    var synopsis: String {get}
    var broadcastChannel: String {get}
    var imageURLs: [ImageURLDetails] {get}
    func getImageURL(for resolution: URLImageResolution) -> ImageURLDetails
    var imageURLsCount: Int {get}
}

struct VideoDataItemStruct: VideoDataItem {
    var title: String
    var synopsis: String
    var broadcastChannel: String
    var imageURLs: [ImageURLDetails]
    var imageURLsCount: Int {return imageURLs.count}

    init (title: String,
          synopsis: String,
          broadcastChannel: String,
          imageURLs: [ImageURLDetails]) {
        self.title = title
        self.synopsis = synopsis
        self.broadcastChannel = broadcastChannel
        self.imageURLs = imageURLs
    }
    
    func getImageURL(for resolution: URLImageResolution) -> ImageURLDetails {

        var bestDifference = imageURLs.first!.resolution.pixels - resolution.pixels
        var bestImageURLDetails = imageURLs.first!

        for imageURL in imageURLs {
            let currentDifference = imageURL.resolution.pixels - resolution.pixels

            // if current image is bigger or equal than requested
            if currentDifference >= 0 {
                // if the current best image isn't bigger than requested
                if bestDifference < 0 {
                    bestImageURLDetails = imageURL
                    bestDifference = currentDifference
                } else {
                    // if current image is closer to the requested than current best
                    if currentDifference < bestDifference {
                        bestImageURLDetails = imageURL
                        bestDifference = currentDifference
                    }
                }
            } else {
                // The current image is smaller than requested
                // If the best is smaller than requested and the current image is closer
                if (bestDifference < 0) && (currentDifference > bestDifference) {
                    bestImageURLDetails = imageURL
                    bestDifference = currentDifference
                }
            }
        }
        return bestImageURLDetails
    }
}
