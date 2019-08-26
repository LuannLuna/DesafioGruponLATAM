//
//  Mobile.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Mobile: Codable {
    let pages: [String]
    let mobile_image: String
    let type: Int
    let link: String
    let tag_marketing: String
    let collections: String
    let category: String
    let subcategories: String
    let regions: String
    let attributes: String
    let active: Bool
    let is_activation: Bool
    
    init(_ json: JSON) {
        self.mobile_image = json["mobile_image"].stringValue
        self.type = json["type"].intValue
        self.link = json["link"].stringValue
        self.tag_marketing = json["tag_marketing"].stringValue
        self.collections = json["collections"].stringValue
        self.category = json["category"].stringValue
        self.subcategories = json["subcategories"].stringValue
        self.regions = json["regions"].stringValue
        self.attributes = json["attributes"].stringValue
        self.active = json["active"].boolValue
        self.is_activation = json["is_activation"].boolValue
        
        var pages: [String] = []
        for page in json["pages"].arrayValue {
            pages.append(page.stringValue)
        }
        self.pages = pages
    }
}
