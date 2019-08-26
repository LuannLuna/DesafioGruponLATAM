//
//  Review.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Review: Codable {
    let company_id: Int
    let score: Double
    let show_score: Bool
    let reviews_count: Int
    init(_ json: JSON) {
        self.company_id = json["company_id"].intValue
        self.score = json["score"].doubleValue
        self.show_score = json["show_score"].boolValue
        self.reviews_count = json["reviews_count"].intValue
    }
}

