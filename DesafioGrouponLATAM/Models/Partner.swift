//
//  Partner.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Partner: PartLoc {
    let review: Review
    override init(_ json: JSON) {
        self.review = Review(json["review"])
        super.init(json)
        
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
