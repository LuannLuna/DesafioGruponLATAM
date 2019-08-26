//
//  Deal.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import SwiftyJSON

class Deal: Codable {
    let deal_id: String
    let contract_number: String
    let contract_id: String
    let deal_type: String
    let deal_category: String
    let page_id: String
    let title: String
    let short_title: String
    let ultra_brief_description: String
    let highlights: String
    let fine_print: String
    let validity_message: String
    let formatted_url: String
    let legacy_formatted_url: String
    let unified_discount_id: Int
    let _public: Bool
    let sold_out: Bool
    let expiration_date: Date
    let available_units: Int
    let tags: [String]
    let tag_categories: [String]
    let tag_categories_names: [String]
    let tag_subcategories: [String]
    let tag_subcategories_names: [String]
    let tag_regions: [String]
    let tag_regions_names: [String]
    let tag_marketing: [String]
    let attributes: [String]
    let deal_city: String
    let canonical_url: String
    let shortened_url: String
    let full_price: Double
    let sale_price: Double
    let percentage_saved: String
    let sold_units_by_contract: Int
    let remaining_units: Int
    let marketing_campaign: String
    let shipping_address_required: Bool
    let cpf_required: Bool
    let show_cart_confirmation: Bool
    let one_year_promotion: Bool
    let deal_format: String
    let booking_required: Bool
    let pre_booking_required: Bool
    let coupon_cancel_auto: Bool
    let coupon_cancel_transaction_acquirer: Bool
    let coupon_print_required: Bool
    let mobile_recharge: Bool
    let webview_cart: Bool
    let deal_disclosure: String
    let pre_booking_mandatory: Bool
    let symbolic_deal: Bool
    let email_subject: String
    let sold_units: Int
    let show_discount: Bool
    let min_sale_price: Double
    let salesforce_deal_id: String
    let show_select_levels: Bool
    let pages: [String]
    let publishing_date: Date
    let last_purchase_date: Date
    let first_publishing_date: Date
    let enabled_domain: [String]
    let sales_forecast_number: Int
    let hotel_booking: Bool
    let show_address: Bool
    let immediate_use: Bool
    let only_3ds: Bool
    let option_type: String
    let dealImage: String
    let dealOriginalImage: String
    let local: Bool
    let travel: Bool
    let product: Bool
    let location: [Location]
    let locations: [Locations]
    let images: [Image]
    let partner: Partner
    
    init(_ json: JSON) {
        self.deal_id = json["deal_id"].stringValue
        self.contract_number = json["contract_number"].stringValue
        self.contract_id = json["contract_id"].stringValue
        self.deal_type = json["deal_type"].stringValue
        self.deal_category = json["deal_category"].stringValue
        self.page_id = json["page_id"].stringValue
        self.title = json["title"].stringValue
        self.short_title = json["short_title"].stringValue
        self.ultra_brief_description = json["ultra_brief_description"].stringValue
        self.highlights = json["highlights"].stringValue
        self.fine_print = json["fine_print"].stringValue
        self.validity_message = json["validity_message"].stringValue
        self.formatted_url = json["formatted_url"].stringValue
        self.legacy_formatted_url = json["legacy_formatted_url"].stringValue
        self.unified_discount_id = json["unified_discount_id"].intValue
        self._public = json["public"].boolValue
        self.sold_out = json["sold_out"].boolValue
        self.deal_city = json["deal_city"].stringValue
        self.canonical_url = json["canonical_url"].stringValue
        self.shortened_url = json["shortened_url"].stringValue
        self.full_price = json["full_price"].doubleValue
        self.sale_price = json["sale_price"].doubleValue
        self.percentage_saved = json["percentage_saved"].stringValue
        self.sold_units_by_contract = json["sold_units_by_contract"].intValue
        self.remaining_units = json["remaining_units"].intValue
        self.marketing_campaign = json["marketing_campaign"].stringValue
        self.shipping_address_required = json["shipping_address_required"].boolValue
        self.cpf_required = json["cpf_required"].boolValue
        self.show_cart_confirmation = json["show_cart_confirmation"].boolValue
        self.one_year_promotion = json["one_year_promotion"].boolValue
        self.deal_format = json["deal_format"].stringValue
        self.booking_required = json["booking_required"].boolValue
        self.pre_booking_required = json["pre_booking_required"].boolValue
        self.coupon_cancel_auto = json["coupon_cancel_auto"].boolValue
        self.coupon_cancel_transaction_acquirer = json["coupon_cancel_transaction_acquirer"].boolValue
        self.coupon_print_required = json["coupon_print_required"].boolValue
        self.mobile_recharge = json["mobile_recharge"].boolValue
        self.webview_cart = json["webview_cart"].boolValue
        self.deal_disclosure = json["deal_disclosure"].stringValue
        self.pre_booking_mandatory = json["pre_booking_mandatory"].boolValue
        self.symbolic_deal = json["symbolic_deal"].boolValue
        self.email_subject = json["email_subject"].stringValue
        self.sold_units = json["sold_units"].intValue
        self.show_discount = json["show_discount"].boolValue
        self.min_sale_price = json["min_sale_price"].doubleValue
        self.salesforce_deal_id = json["salesforce_deal_id"].stringValue
        self.show_select_levels = json["show_select_levels"].boolValue
        self.sales_forecast_number = json["sales_forecast_number"].intValue
        self.hotel_booking = json["hotel_booking"].boolValue
        self.show_address = json["show_address"].boolValue
        self.immediate_use = json["immediate_use"].boolValue
        self.only_3ds = json["only_3ds"].boolValue
        self.option_type = json["option_type"].stringValue
        self.dealImage = json["dealImage"].stringValue
        self.dealOriginalImage = json["dealOriginalImage"].stringValue
        self.local = json["local"].boolValue
        self.travel = json["travel"].boolValue
        self.product = json["product"].boolValue
        self.partner = Partner(json["partner"])
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddTHH:mm:ssZ"
        self.expiration_date = formatter.date(from: json["expiration_date"].stringValue) ?? Date()
        self.publishing_date = formatter.date(from: json["publishing_date"].stringValue) ?? Date()
        self.last_purchase_date = formatter.date(from: json["last_purchase_date"].stringValue) ?? Date()
        self.first_publishing_date = formatter.date(from: json["first_publishing_date"].stringValue) ?? Date()
        
        self.available_units = json["available_units"].intValue
        
        var tags: [String] = []
        for tag in json["tags"].arrayValue{ tags.append(tag.stringValue) }
        self.tags = tags
        
        var tag_categories: [String] = []
        for tag in json["tag_categories"].arrayValue{ tag_categories.append(tag.stringValue) }
        self.tag_categories = tag_categories
        
        var tag_categories_names: [String] = []
        for tag in json["tag_categories_names"].arrayValue{ tag_categories_names.append(tag.stringValue) }
        self.tag_categories_names = tag_categories_names
        
        var tag_subcategories: [String] = []
        for tag in json["tag_subcategories"].arrayValue{ tag_subcategories.append(tag.stringValue) }
        self.tag_subcategories = tag_subcategories
        
        var tag_subcategories_names: [String] = []
        for tag in json["tag_subcategories_names"].arrayValue{ tag_subcategories_names.append(tag.stringValue) }
        self.tag_subcategories_names = tag_subcategories_names
        
        var tag_regions: [String] = []
        for tag in json["tag_regions"].arrayValue{ tag_regions.append(tag.stringValue) }
        self.tag_regions = tag_regions
        
        var tag_regions_names: [String] = []
        for tag in json["tag_regions_names"].arrayValue{ tag_regions_names.append(tag.stringValue) }
        self.tag_regions_names = tag_regions_names
        
        var tag_marketing: [String] = []
        for tag in json["tag_marketing"].arrayValue{ tag_marketing.append(tag.stringValue) }
        self.tag_marketing = tag_marketing
        
        var attributes: [String] = []
        for tag in json["attributes"].arrayValue{ attributes.append(tag.stringValue) }
        self.attributes = attributes
        
        var pages: [String] = []
        for tag in json["page"].arrayValue{ pages.append(tag.stringValue) }
        self.pages = pages
        
        var enabled_domain: [String] = []
        for domain in json["enabled_domain"].arrayValue{ enabled_domain.append(domain.stringValue) }
        self.enabled_domain = enabled_domain
        
        var location: [Location] = []
        for loc in json["location"].arrayValue { location.append(Location(loc)) }
        self.location = location
        
        var locations: [Locations] = []
        for location in json["locations"].arrayValue { locations.append(Locations(location)) }
        self.locations = locations
        
        var images: [Image] = []
        for image in json["images"].arrayValue { images.append(Image(image))}
        self.images = images
        
    }
    
//    buying_options
}
