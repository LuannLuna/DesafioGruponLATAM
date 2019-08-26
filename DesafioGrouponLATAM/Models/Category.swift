//
//  Categories.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Category:Codable {
    let slug: String
    let name: String
    let title: String
    let description: String
    let order: Int
    let parent: String
    let visible: Bool
    let website: Bool
    let mobile: Bool
    let tag_type: Int
    let tag_supertype: Int
    let icon: String
    let image: String
    let phoenix_category: String
    let pageId: String
    let aliases: [String]
    let enabled_domain: [String]
    let childrenSlugs: [String]
    let children: [Category]
    let ancestors: [String]
    
    init(_ json: JSON) {
        self.slug = json["slug"].stringValue
        self.name = json["name"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.order = json["order"].intValue
        self.parent = json["parent"].stringValue
        self.visible = json["visible"].boolValue
        self.website = json["website"].boolValue
        self.mobile = json["mobile"].boolValue
        self.tag_type = json["tag_type"].intValue
        self.tag_supertype = json["tag_supertype"].intValue
        self.icon = json["icon"].stringValue
        self.image = json["icon"].stringValue
        self.phoenix_category = json["phoenix_category"].stringValue
        self.pageId = json["pageId"].stringValue
        
        var enabled_domain: [String] = []
        for domain in json["enabled_domain"].arrayValue {
            enabled_domain.append(domain.stringValue)
        }
        self.enabled_domain = enabled_domain
        
        var aliases: [String] = []
        for aliase in json["aliases"].arrayValue {
            aliases.append(aliase.stringValue)
        }
        self.aliases = aliases
        
        var childrenSlugs: [String] = []
        for child in json["childrenSlugs"].arrayValue {
            childrenSlugs.append(child.stringValue)
        }
        self.childrenSlugs = childrenSlugs
        
        var children: [Category] = []
        for child in json["children"].arrayValue {
            children.append(Category(child))
        }
        self.children = children
        
        var ancestors: [String] = []
        for ancestor in json["ancestors"].arrayValue {
            ancestors.append(ancestor.stringValue)
        }
        self.ancestors = ancestors
    }
    
}
