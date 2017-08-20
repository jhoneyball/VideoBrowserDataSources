import Foundation
import XCTest
@testable import VideoBrowserDataSources

class test_DataFromBundleFile: XCTestCase {
    func test_DataFromBundleFile_FailsToLoad() {
        
        let videoJSONFeed = DataFromBundleFile(fromFile: "NoFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!)
        XCTAssertNil(videoJSONFeed)
    }
    
    
    func test_DataFromBundleFile_OpensValidFile() {
        
        let videoJSONFeed = DataFromBundleFile(fromFile: "TestFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!)
        XCTAssertNotNil(videoJSONFeed)
    }

}
