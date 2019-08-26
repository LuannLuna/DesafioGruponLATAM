//
//  Banner.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Banner: Codable {
    let name: String
    let title: String
    let label: String
    let priority: Int
    let start_date: Date
    let end_date: Date
    let is_ios: Bool
    let is_android: Bool
    let mobile: Mobile
    
    init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.title = json["title"].stringValue
        self.label = json["label"].stringValue
        self.priority = json["priority"].intValue
        
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy-MM-dd"
        self.start_date = formmater.date(from: json["start_date"].stringValue) ?? Date()
        self.end_date = formmater.date(from: json["end_date"].stringValue) ?? Date()
        
        self.is_ios = json["is_ios"].boolValue
        self.is_android = json["is_android"].boolValue
        
        self.mobile = Mobile(json["mobile"])
    }
}
