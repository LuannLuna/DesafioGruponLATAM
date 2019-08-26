//
//  Image.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Image: Codable {
    let image: String
    let thumb: String
    let original: String
    
    init(_ json: JSON) {
        self.image = json["image"].stringValue
        self.thumb = json["thumb"].stringValue
        self.original = json["original"].stringValue
    }
}
