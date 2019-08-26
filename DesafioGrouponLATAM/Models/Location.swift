//
//  Location.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Location: Codable {
    let lon: Float
    let lat: Float
    
    init(_ json: JSON) {
        self.lat = json["lat"].floatValue
        self.lon = json["lon"].floatValue
    }
}
