//
//  PartLoc.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class PartLoc: Codable {
    let account_id: String
    let description: String
    let name: String
    let neighborhood: String
    let address: String
    let number: String
    let additional_address_info: String
    let city: String
    let state: String
    let zip_code: String
    let phone_number: String
    let website: String
    let formatted_url: String
    let image: String
    let company_name: String
    let cnpj: String
    let canonical_url: String
    let place_name: String
    let city_slug: String
    let neighborhood_slug_name: String
    
    init(_ json: JSON) {
        self.account_id = json["account_id"].stringValue
        self.description = json["description"].stringValue
        self.name = json["name"].stringValue
        self.neighborhood = json["neighborhood"].stringValue
        self.address = json["address"].stringValue
        self.number = json["number"].stringValue
        self.additional_address_info = json["additional_address_info"].stringValue
        self.city = json["city"].stringValue
        self.state = json["state"].stringValue
        self.zip_code = json["zip_code"].stringValue
        self.phone_number = json["phone_number"].stringValue
        self.website = json["website"].stringValue
        self.formatted_url = json["formatted_url"].stringValue
        self.image = json["image"].stringValue
        self.company_name = json["company_name"].stringValue
        self.cnpj = json["cnpj"].stringValue
        self.canonical_url = json["canonical_url"].stringValue
        self.place_name = json["place_name"].stringValue
        self.city_slug = json["city_slug"].stringValue
        self.neighborhood_slug_name = json["neighborhood_slug_name"].stringValue
    }
}
