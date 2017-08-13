import XCTest
@testable import VideoBrowserDataSources


class URLImageResoltionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAURLImageResolutionCreatedWithASingleInt() {
        let sut: URLImageResolution = URLImageResolution(1920)
        XCTAssertEqual(1920, sut.pixels)
        XCTAssertEqual(1920, sut.horizontalPixels)
        XCTAssertEqual(0, sut.verticalPixels)
    }
    
    func testAURLImageResolutionCreatedWithATwoInts() {
        let sut: URLImageResolution = URLImageResolution(horizontalPixels: 1280, verticalPixels: 720)
        XCTAssertEqual(1280, sut.pixels)
        XCTAssertEqual(1280, sut.horizontalPixels)
        XCTAssertEqual(720, sut.verticalPixels)
    }
    
    
}

