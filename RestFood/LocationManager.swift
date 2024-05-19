//
//  LocationManager.swift
//  RestFood
//
//  Created by Danil on 12.05.2024.
//

import Foundation
import CoreLocation
import MapKit

struct LocationDetails {
    var city: String?
    var street: String?
    var buildingNumber: String?
    var coordinate: CLLocationCoordinate2D?
}

class LocationManager: NSObject {
    
    // Singleton
    static let shared = LocationManager()
    
    // Location manager
    let clManager = CLLocationManager()
    
    // Stored property for location details
    private(set) var locationDetails: LocationDetails?
    
    // Private init to ensure singleton
    private override init() {
        super.init()
        setUpCLManager()
    }
    
    // MARK: - Helper Functions
    
    private func setUpCLManager() {
        clManager.delegate = self
        checkLocationPermissions()
        clManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationPermissions() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request permission
            requestPermissions()
        case .restricted, .denied:
            // Possible alert controller to inform
            print("Access to location services has either been denied or it is restricted.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Hooray! It's authorized!")
            clManager.startUpdatingLocation()
        @unknown default:
            print("A new status is available that was not handled.")
        }
    }
    
    private func requestPermissions() {
        clManager.requestWhenInUseAuthorization()
    }
    
    func fetchCurrentLocation(completion: @escaping (CLPlacemark?) -> Void) {
        if let location = clManager.location {
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                } else if let placemark = placemarks?.first {
                    self.locationDetails = LocationDetails(
                        city: placemark.locality,
                        street: placemark.thoroughfare,
                        buildingNumber: placemark.subThoroughfare,
                        coordinate: placemark.location?.coordinate
                    )
                    self.clManager.stopUpdatingLocation()
                    completion(placemark)
                }
            }
        } else {
            completion(nil)
        }
    }
    
    func printLocationDetails() {
        if let details = locationDetails {
            let city = details.city ?? "Unknown city"
            let street = details.street ?? "Unknown street"
            let buildingNumber = details.buildingNumber ?? "Unknown building number"
            print("City: \(city), Street: \(street), Building Number: \(buildingNumber)")
        } else {
            print("Location details are not available.")
        }
    }
    
    func updateMapView(_ mapView: MKMapView) {
        guard let details = locationDetails, let coordinate = details.coordinate else {
            print("No location details to show on the map.")
            return
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = details.city
        annotation.subtitle = "\(details.street ?? ""), \(details.buildingNumber ?? "")"
        
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // We can update the location details when a new location update is received
        fetchCurrentLocation { _ in }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationPermissions()
    }
}

