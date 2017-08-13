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

class testVideoJSONFeed: XCTestCase {
    func testVideoJSONFeedFailsToLoad() {
        
        let videoJSONFeed = VideoJSONFeed(fromFile: "NoFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!)
        XCTAssertNil(videoJSONFeed)
    }
    
    
    func testVideoJSONFeedExistance() {
        
        let videoJSONFeed = VideoJSONFeed(fromFile: "TestFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!)
        XCTAssertNotNil(videoJSONFeed)
    }
    
    func testVideoJSONFeedContainsValidJSON() {
        if let videoJSONFeed = VideoJSONFeed(fromFile: "TestFeed", ofType: "json", in: Bundle(identifier: "com.honeyball.VideoBrowserDataSourcesTests")!) {
            let jsonStringData: Data = videoJSONFeed.theJSONData
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
