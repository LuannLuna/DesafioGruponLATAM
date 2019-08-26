//
//  Locations.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Locations: PartLoc {
    let location: Location
    override init(_ json: JSON) {
        self.location = Location(json["location"])
        super.init(json)
        
    }
    
    private enum CodingKeys: String, CodingKey {
        case location = "location"
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decode(Location.self, forKey: .location)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(location, forKey: .location)
    }
}
