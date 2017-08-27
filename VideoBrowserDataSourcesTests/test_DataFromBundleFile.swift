
import XCTest
@testable import VideoBrowserDataSources

class test_DataFromBundleFile: XCTestCase {
    func test_DataFromBundleFile_FailsToLoad() {
        if let bundle = Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests") {
            let videoJSONFeed = DataFromBundleFile(fromFile: "NoFeed", ofType: "json", in: bundle)
            XCTAssertNil(videoJSONFeed)
        } else {
            XCTFail()
        }
    }
    
    
    func test_DataFromBundleFile_OpensValidFile() {
        if let bundle = Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests") {
            let videoJSONFeed = DataFromBundleFile(fromFile: "TestFeed", ofType: "json", in: bundle)
            XCTAssertNotNil(videoJSONFeed)
        } else {
            XCTFail()
        }
    }
}
