//
//  CategoryList.swift
//  Multi Radio
//
//  Created by theReza on 25/6/18.
//  Copyright © 2018 MCC. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryList:Mappable
{
    var categoryId: Int?
    var categoryName: String?
    var categoryLogoURL:String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        categoryId         <- map["category_id"]
        categoryName       <- map["category_name"]
        categoryLogoURL    <- map["category_logo_url"]

    }
}
