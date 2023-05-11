//
//  SourceDataVO.swift
//  News
//
//  Created by Daewi on 5/11/23.
//

import Foundation
import ObjectMapper

class SourceDataVO: Mappable{
    var id: String?
    var name: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

//    -{
//        -"source": {
//        "id": "the-verge",
//        "name": "The Verge"
//    },
