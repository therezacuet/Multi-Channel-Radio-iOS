//
//  AlamofireWrapper.swift
//  Multi Radio
//
//  Created by Md. Nasir on 25/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper
import PromiseKit

class AlamofireWrapper {
    
    static let sharedInstance = AlamofireWrapper()
    
    func getCostumers(_ strURL: String) -> Promise<[ChannelList]>{
        
        return Promise<[ChannelList]>{
            fullfil, reject -> Void in
            return Alamofire.request(strURL).responseString {
                response in
                
                switch(response.result){
                case .success(let responseString):
                    print(responseString)
                    let channelDataResponse = ChannelList(JSONString: "\(responseString)")
                    fullfil(channelDataResponse.channel_list!)
                case .failure(let error):
                    print(error)
                    reject(error)
                }
            }
        }

    }
}
