
import XCTest
@testable import VideoBrowserDataSources


class test_VideoDataItem: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_CreatingAVideoDataItem() {
        let sut: VideoDataItem = VideoDataItemStruct(title: "The title",
                                                     synopsis: "The synopsis",
                                                     broadcastChannel: "The broadcast channel",
                                                     imageURLs: [ImageURLDetails(url: "The image url", resolution: URLImageResolution(123))])
        XCTAssertEqual("The title", sut.title)
        XCTAssertEqual("The synopsis", sut.synopsis)
        XCTAssertEqual("The broadcast channel", sut.broadcastChannel)
        XCTAssertEqual(1, sut.imageURLs.count)

        let sutImageURLDetails = sut.imageURLs.first!
        XCTAssertEqual(123, sutImageURLDetails.resolution.pixels)
        XCTAssertEqual("The image url", sutImageURLDetails.url)
    }
    
    
    
    func test_VideoDataItemWith3ImageURLs() {
        
        let sutImageURL1 = ImageURLDetails(url: "The first image url", resolution: URLImageResolution(123))
        let sutImageURL2 = ImageURLDetails(url: "The second image url", resolution: URLImageResolution(246))
        let sutImageURL3 = ImageURLDetails(url: "The third image url", resolution: URLImageResolution(999))
        let sutImageURLs = [sutImageURL1, sutImageURL2, sutImageURL3]
        let sut: VideoDataItem = VideoDataItemStruct(title: "The title",
                                                     synopsis: "The synopsis",
                                                     broadcastChannel: "The broadcast channel",
                                                     imageURLs: sutImageURLs)

        XCTAssertEqual(3, sut.imageURLs.count)

        let sutFirstImageURL = sut.imageURLs[0]
        XCTAssertEqual("The first image url", sutFirstImageURL.url)
        XCTAssertEqual(123, sutFirstImageURL.resolution.pixels)

        let sutSecondImageURL = sut.imageURLs[1]
        XCTAssertEqual("The second image url", sutSecondImageURL.url)
        XCTAssertEqual(246, sutSecondImageURL.resolution.pixels)
        
        let sutThirdImageURL = sut.imageURLs[2]
        XCTAssertEqual("The third image url", sutThirdImageURL.url)
        XCTAssertEqual(999, sutThirdImageURL.resolution.pixels)

    }
}
