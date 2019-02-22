//
//  Location.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation
import CoreLocation

struct Location {
    let latitude: Double
    let longitude: Double

    var asCLLocationCoordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
