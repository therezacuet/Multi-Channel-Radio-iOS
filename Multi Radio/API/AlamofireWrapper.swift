//
//  AlamofireWrapper.swift
//  Multi Radio
//
//  Created by Md. Nasir on 25/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import Alamofire
import ObjectMapper

class AlamofireWrapper {
    
    static let sharedInstance = AlamofireWrapper()
    
    func getCostumers(_ strURL: String, completion:@escaping (Array<Customer>) -> Void, failure:@escaping (Error) -> Void) -> Void{
        
        Alamofire.request(strURL).responseJSON { response in
            switch response.result {
            case .success:
                //to get JSON return value
                guard let responseJSON = response.result.value as? Array<[String: AnyObject]> else {
                    failure(response.result.error!)
                    return
                }
                guard let customers:[Customer] = Mapper<Customer>().mapArray(JSONArray: responseJSON) else {
                    failure(response.result.error!)
                    return
                }
                
                completion(customers)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
