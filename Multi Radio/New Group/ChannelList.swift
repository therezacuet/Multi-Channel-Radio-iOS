//
//  ChannelList.swift
//  Multi Radio
//
//  Created by Md. Nasir on 26/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import Foundation
import ObjectMapper

class ChannelList : Mappable {
    var channel_list : [ChannelListItem]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        channel_list <- map["channel_list"]
    }
    
}

class ChannelListItem:Mappable
{
    var channelId: Int?
    var categoryId: Int?
    var channelName: String?
    var channelLogoURL:String?
    var streamURL:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        channelId         <- map["channel_id"]
        categoryId        <- map["category_id"]
        channelName       <- map["channel_name"]
        channelLogoURL    <- map["channel_logo_url"]
        streamURL         <- map["stream_url"]
    }
}
