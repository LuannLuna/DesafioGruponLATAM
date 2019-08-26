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
    
    private enum CodingKeys: String, CodingKey {
        case review = "review"
        
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        review = try container.decode(Review.self, forKey: .review)
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(review, forKey: .review)
    }
}
