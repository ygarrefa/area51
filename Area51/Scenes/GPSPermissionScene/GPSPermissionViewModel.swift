//
//  GPSPermissionViewModel.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation
import CoreLocation

class GPSPermissionViewModel: NSObject, GPSPermissionViewModelProtocol {
    private let locationManager = CLLocationManager()
    var locationUpdated: (Location?) -> Void = { _ in }

    var gpsPermissionAlreadyRequested: Bool {
        return CLLocationManager.authorizationStatus() != .notDetermined
    }

    var isLocationServicesEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }

    func requestGPSPermission() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }

    func getUserLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

extension GPSPermissionViewModel: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]) {

        guard let location: CLLocationCoordinate2D =
            manager.location?.coordinate else { return }

        let startLocation = Location(
            latitude: location.latitude,
            longitude: location.longitude)

        locationUpdated(startLocation)
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error) {

        locationUpdated(nil)
    }
}
