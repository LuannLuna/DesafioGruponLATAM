//
//  CityPresenter.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import Alamofire
import SwiftyJSON

class CityPresenter {
    let manager = Alamofire.SessionManager.default
    
    var banners: [Banner] = []
    var categories: [Category] = []
    var deals: [Deal] = []
    
    init() {
        
    }
    
    func requestData(route: Router, onSuccess: @escaping ()->Void, onFail: @escaping ()->Void) {
        manager.request(route).validate().responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                onFail()
            case .success(let value):
                let json = JSON(value)["response"]
                for banner in json["banners"].arrayValue {
                    let banner = Banner(banner)
                    if !self.banners.contains(where: { (elm) -> Bool in
                        return elm.title == banner.title
                    }) {
                        self.banners.append(banner)
                    }
                }
                
                for category in json["categories"].arrayValue {
                    let category = Category(category)
                    if !self.categories.contains(where: { (elm) -> Bool in
                        return elm.title == category.title
                    }) {
                      self.categories.append(category)
                    }
                    
                }
                
                for deal in json["deals"].arrayValue {
                    let deal = Deal(deal)
                    if !self.deals.contains(where: { (elm) -> Bool in
                        return elm.title == deal.title
                    }){
                        self.deals.append(deal)
                    }
                    
                }
                
                onSuccess()
            }
        }
    }
    
}
