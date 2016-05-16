//
//  SubStoreModel.swift
//  PLASOFTWARE
//
//  Created by Chris on 16/5/16.
//  Copyright © 2016年 Young. All rights reserved.
//

import Alamofire
import ObjectMapper

//store info
class StoreModel: Mappable {
    
    var id : String?
    var name: String?
    var branches: [SubStoreModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map:Map){
        id <- map["id"]
        name <- map["name"]
        branches <- map["store"]
    }
    
}

//branches info
class SubStoreModel: Mappable {
    
    var id : String?
    var name: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    
}