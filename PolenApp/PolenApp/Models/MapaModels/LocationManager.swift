//
//  LocationManager.swift
//  PolenApp
//
//  Created by Pedro Henrique Spínola de Assis on 24/11/20.
//

import Foundation
import MapKit
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    
    private let locationManager = CLLocationManager()
    
    var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
    }
    
}
