//
//  Model.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import UIKit
import SwiftyJSON

struct DataDM {
    var image:String
    var text:String
    var location:String
    var firstSeen:String
    var backcolor:String
    var lbl:String
    var url:String
    
    init(json:JSON) {
        self.image = json["image"].stringValue
        self.text = json["name"].stringValue
        self.location =  json["location"]["name"].stringValue
        self.lbl = json["status"].stringValue + " - " + json["species"].stringValue
        self.backcolor = json["status"].stringValue
        self.firstSeen = json["gender"].stringValue
        self.url = json["url"].stringValue
    }
}

