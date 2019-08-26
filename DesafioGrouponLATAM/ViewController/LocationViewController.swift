//
//  LocationViewController.swift
//  DesafioGrouponLATAM
//
//  Created by Luann Marques Luna on 26/08/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit
import MapKit

enum MapMessaType {
    case routeError
    case authorizationWarning
}

class LocationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    lazy var locationManager = CLLocationManager()
    var btUserLocation: MKUserTrackingButton!
    
    var manager = MenuPresenter(filename: "city.deals.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView.mapType = .mutedStandard
        locationManager.delegate = self
        
        
        
        configureLocationButton()
        requestUserLocationAuthorization()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager = MenuPresenter(filename: "city.deals.json")
        
        tabBarController?.navigationItem.leftBarButtonItem = nil
        tabBarController?.navigationItem.largeTitleDisplayMode = .never
        tabBarController?.navigationItem.searchController = nil
        let filterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.rightBarButtonItems = [filterButton]
        
        if mapView.annotations.count == 0 {
            for location in self.manager.deals{
                for loc in location.locations {
                    addToMap(Place(name: loc.name, latitude: CLLocationDegrees(loc.location.lat), longitude: CLLocationDegrees(loc.location.lon), address: loc.address))
                }
            }
        }
    }
    
    
    func addToMap(_ place: Place) {
        let annotation = PlaceAnnotation(coordinate: place.coordinate)
        annotation.title = place.name
        annotation.address = place.address
        mapView.addAnnotation(annotation)
    }
    
    func showPlaces() {
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    
    func configureLocationButton() {
        btUserLocation = MKUserTrackingButton(mapView: mapView)
        btUserLocation.backgroundColor = .white
        btUserLocation.frame.origin.x = 10
        btUserLocation.frame.origin.y = 10
        btUserLocation.layer.cornerRadius = 5
        btUserLocation.layer.borderWidth = 1
        btUserLocation.layer.borderColor = UIColor(named: "main")?.cgColor
    }
    
    func requestUserLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                mapView.addSubview(btUserLocation)
            case .denied:
                showMessage(type: .authorizationWarning)
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                break
            }
        }else {
            // Não dá
        }
    }
    
    func showMessage(type: MapMessaType) {
        let title = type == .authorizationWarning ? "Aviso" : "Erro"
        let message = type == .authorizationWarning ? "Para usar os recursos de localização do App, você precisa permitir o uso na tela de Ajustes" : "Não foi possível encontrar esta rota"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if type == .authorizationWarning {
            let confirmAction = UIAlertAction(title: "Ir para Ajustes", style: .default) { (action) in
                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                }
            }
            alert.addAction(confirmAction)
        }
        present(alert, animated: true, completion: nil)
    }


}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is PlaceAnnotation) {
            return nil
        }
//        let type = (annotation as! PlaceAnnotation).type
//        let identifier = "\(type)"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        }
        annotationView?.annotation = annotation
        annotationView?.canShowCallout = true
        annotationView?.markerTintColor = UIColor.blue
        annotationView?.displayPriority = .required
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 5.0
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}

extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            mapView.showsUserLocation = true
            mapView.addSubview(btUserLocation)
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        Monitorando a localização do usuário via código
        
        //        if let location = locations.last {
        //            print("Velocidade: \(location.speed)")
        //            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        //            mapView.setRegion(region, animated: true)
        //        }
        print(locations.last!)
    }
}
