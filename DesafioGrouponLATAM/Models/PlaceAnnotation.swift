//
//  PlaceAnnotation.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 26/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var address: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
