//
//  Location.swift
//  Sunrise Sunset
//
//  Created by Paul Baker on 4/9/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import Foundation
import MapKit

class Location: NSObject, CLLocationManagerDelegate  {
    
    let locationManager = CLLocationManager()
   // let latitude: Double
   // let longitude: Double
    var geoCoder = CLGeocoder()
    var currentLocationString = ""
    
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.stopUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil) {
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count > 0{
                let placemark = placemarks![0]
                print(placemark.locality!)
                print(placemark.administrativeArea!)
                print(placemark.country!)
                
                self.currentLocationString = "\(placemark.locality!), \(placemark.administrativeArea!), \(placemark.country!)"
            }
        }
    }
    
    
}


//func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    let userLocation:CLLocation = locations[0] as CLLocation
//
//    manager.stopUpdatingLocation()
//
//    let coordinations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//}
