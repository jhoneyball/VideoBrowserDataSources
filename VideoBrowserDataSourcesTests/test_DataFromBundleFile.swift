//
//  testVideoJSONFeed.swift
//  VideoBrowser
//
//  Created by James Honeyball on 03/06/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//
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
    
    func testVideoJSONFeedContainsValidJSON() {
        if let dataFromBundleFile = DataFromBundleFile(fromFile: "TestFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!) {
            let jsonStringData: Data = dataFromBundleFile.data
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: jsonStringData, options: [])
                XCTAssertNotNil(jsonObject)
            } catch {
                XCTFail("Cannot serialise Feed.json into json object")
            }
        } else {
            XCTFail()
            
        }
    }
}
