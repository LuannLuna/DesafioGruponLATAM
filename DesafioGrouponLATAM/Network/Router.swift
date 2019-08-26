//
//  Router.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 25/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseUrlString = "https://gist.githubusercontent.com/insidegui/"
    
    case city
    case travel
    case product
    
    var method: HTTPMethod { return .get }
    
    var path: String {
        switch self {
        case .city:
            return "2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
        case .product:
            return "007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json"
        case .travel:
            return "d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseUrlString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.timeoutInterval = TimeInterval(10.0)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
