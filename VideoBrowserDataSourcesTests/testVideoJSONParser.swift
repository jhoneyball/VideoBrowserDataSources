//
//  testVideoJSONParser.swift
//  VideoBrowser
//
//  Created by James Honeyball on 03/06/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import XCTest
@testable import VideoBrowserDataSources

class testVideoJSONParser: XCTestCase {
    
    func testLinks() {
        let testJSON = "{\"_links\": [{\"title\": \"honeyball\"}]}".data(using: .utf8)!
        let videoJSONParser = VideoJSONParser(from: testJSON)!
        XCTAssertEqual("honeyball", videoJSONParser.videoDataItems.first?.title)
    }
    
    func testRealItem() {
        let testJSON = "{\"_links\":[{\"title\":\"Chelsea v Sunderland\",\"synopsis\":\"Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.\",\"id\":\"ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"contentType\":\"STANDARD_VIDEO\",\"shortDescription\":\"Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.\",\"images\":[{\"width\":180,\"height\":100,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/S_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=3a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"small\"},{\"width\":330,\"height\":235,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/M_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=4a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"medium\"},{\"width\":1280,\"height\":720,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/MAS_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=5a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"master\"},{\"width\":450,\"height\":250,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/L_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=6a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"large\"}],\"broadcastChannelValue\":\"Sky Sports\",\"sortTitle\":\"Chelsea v Sunderland (GM)\",\"durationMinutes\":2,\"certificate\":\"Unrated\",\"_links\":[{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/item-summaries/ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"_rel\":\"self/item-summary\",\"_attributes\":{}},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/broadcast-channels/14aec13a27bd6210VgnVCM1000001f5012ac____\",\"_rel\":\"broadcast-channel/broadcast-channel\",\"_attributes\":{},\"_title\":\"Sky Sports\"},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/videos/standard-videos/ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"_rel\":\"item/standard-video\",\"_attributes\":{}}]}]}".data(using: .utf8)!
        
        let videoJSONParser = VideoJSONParser(from: testJSON)!
        XCTAssertEqual("Chelsea v Sunderland", videoJSONParser.videoDataItems.first?.title)
        XCTAssertEqual("Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.", videoJSONParser.videoDataItems.first?.synopsis)
        XCTAssertEqual("Sky Sports", videoJSONParser.videoDataItems.first?.broadcastChannel)
        
        
    }

    func testTwoRealItems() {
        let testJSON = "{\"_links\":[{\"title\":\"Chelsea v Sunderland\",\"synopsis\":\"Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.\",\"id\":\"ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"contentType\":\"STANDARD_VIDEO\",\"shortDescription\":\"Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.\",\"images\":[{\"width\":180,\"height\":100,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/S_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=3a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"small\"},{\"width\":330,\"height\":235,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/M_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=4a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"medium\"},{\"width\":1280,\"height\":720,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/MAS_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=5a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"master\"},{\"width\":450,\"height\":250,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/Chelsea%20v%20Sunderland/L_0001494862705287_chelsea_v_sunderland-ingested.jpg?image-id=6a8f653936b2c510VgnVCM1000000b43150a____\",\"type\":\"large\"}],\"broadcastChannelValue\":\"Sky Sports\",\"sortTitle\":\"Chelsea v Sunderland (GM)\",\"durationMinutes\":2,\"certificate\":\"Unrated\",\"_links\":[{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/item-summaries/ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"_rel\":\"self/item-summary\",\"_attributes\":{}},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/broadcast-channels/14aec13a27bd6210VgnVCM1000001f5012ac____\",\"_rel\":\"broadcast-channel/broadcast-channel\",\"_attributes\":{},\"_title\":\"Sky Sports\"},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/videos/standard-videos/ee4b9cb40ec0c510VgnVCM1000000b43150a____\",\"_rel\":\"item/standard-video\",\"_attributes\":{}}]},{\"title\":\"West Brom v Chelsea\",\"synopsis\":\"Highlights of the Premier League match between West Brom and Chelsea from The Hawthorns.\",\"id\":\"01dbe28405dfb510VgnVCM1000000b43150a____\",\"contentType\":\"STANDARD_VIDEO\",\"shortDescription\":\"Highlights of the Premier League match between West Brom and Chelsea from The Hawthorns.\",\"images\":[{\"width\":330,\"height\":235,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/West%20Brom%20v%20Chelsea/M_0001494601643482_west_brom_v_chelsea-ingested.jpg?image-id=0b0dde2ee1efb510VgnVCM1000000b43150a____\",\"type\":\"medium\"},{\"width\":1280,\"height\":720,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/West%20Brom%20v%20Chelsea/MAS_0001494601643482_west_brom_v_chelsea-ingested.jpg?image-id=da0dde2ee1efb510VgnVCM1000000b43150a____\",\"type\":\"master\"},{\"width\":450,\"height\":250,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/West%20Brom%20v%20Chelsea/L_0001494601643482_west_brom_v_chelsea-ingested.jpg?image-id=ea0dde2ee1efb510VgnVCM1000000b43150a____\",\"type\":\"large\"},{\"width\":180,\"height\":100,\"url\":\"http://go.sky.com/static/SVOD/SKYSPORTS/Football/2017/West%20Brom%20v%20Chelsea/S_0001494601643482_west_brom_v_chelsea-ingested.jpg?image-id=fa0dde2ee1efb510VgnVCM1000000b43150a____\",\"type\":\"small\"}],\"broadcastChannelValue\":\"Sky Sports\",\"sortTitle\":\"West Brom v Chelsea (GM)\",\"durationMinutes\":2,\"certificate\":\"Unrated\",\"_links\":[{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/item-summaries/01dbe28405dfb510VgnVCM1000000b43150a____\",\"_rel\":\"self/item-summary\",\"_attributes\":{}},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/broadcast-channels/14aec13a27bd6210VgnVCM1000001f5012ac____\",\"_rel\":\"broadcast-channel/broadcast-channel\",\"_attributes\":{},\"_title\":\"Sky Sports\"},{\"_href\":\"http://content.ott.sky.com/v2/brands/go/devices/skyq/content/videos/standard-videos/01dbe28405dfb510VgnVCM1000000b43150a____\",\"_rel\":\"item/standard-video\",\"_attributes\":{}}]}]}".data(using: .utf8)!
        let videoJSONParser = VideoJSONParser(from: testJSON)!
        XCTAssertEqual("Chelsea v Sunderland", videoJSONParser.videoDataItems[0].title)
        XCTAssertEqual("Highlights of the Premier League match between Chelsea and Sunderland from Stamford Bridge.", videoJSONParser.videoDataItems[0].synopsis)

        XCTAssertEqual("West Brom v Chelsea", videoJSONParser.videoDataItems[1].title)
        XCTAssertEqual("Highlights of the Premier League match between West Brom and Chelsea from The Hawthorns.", videoJSONParser.videoDataItems[1].synopsis)

        
        
    }
}
