
import XCTest
@testable import VideoBrowserDataSources

class ImageURLDetailsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingSingleImageURLDetailsObject() {

        let sut: ImageURLDetails = ImageURLDetails(url: "The URL", resolution: URLImageResolution(720))
        XCTAssertEqual("The URL", sut.url)
        XCTAssertEqual(720, sut.resolution.pixels)
    
    }



}
