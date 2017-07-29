

public protocol VideoDataItem {
    var title: String {get}
    var synopsis: String {get}
    var broadcastChannel: String {get}
    var imageURLs: [ImageURLDetails] {get}
}

struct VideoDataItemStruct: VideoDataItem {
    var title: String
    var synopsis: String
    var broadcastChannel: String
    var imageURLs: [ImageURLDetails]
}

