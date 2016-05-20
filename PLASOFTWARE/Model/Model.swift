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

//projects
class projects: Mappable{
    
    var serviceid : String?
    var servicename : String?
    var serviceprice : String?
    var storeid : String?
    var storename : String?
    var orgid : String?
    var orgname : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        serviceid <- map["serviceid"]
        servicename <- map["servicename"]
        serviceprice <- map["serviceprice"]
        storeid <- map["storeid"]
        storename <- map["storename"]
        orgid <- map["orgid"]
        orgname <- map["orgname"]
        
    }
}

//service and stuff
class serviceAndStuff: Mappable{
    
    var services : [service]?
    var stuffs : [stuff]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        services <- map["service"]
        stuffs <- map["employee"]
    }
}

class service: Mappable {
    
    var id : String?
    var name : String?
    var price : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
    }
}

class stuff: Mappable {
    
    var id : String?
    var name : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

//reservation list
class reservationList: Mappable{
    
    var id : String?
    var name : String?
    var begindate : String?
    var enddate : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        begindate <- map["begindate"]
        enddate <- map["enddate"]
    
    }
}

//reservation Info
class reservationInfo: Mappable{
    
    var storename : String?
    var begindate : String?
    var enddate : String?
    var mobile : String?
    var remark : String?
    var employeename : String?
    var servicename : String?
    var price : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        storename <- map["storename"]
        begindate <- map["begindate"]
        enddate <- map["enddate"]
        mobile <- map["mobile"]
        remark <- map["remark"]
        employeename <- map["employeename"]
        servicename <- map["servicename"]
        price <- map["price"]
        
    }
}