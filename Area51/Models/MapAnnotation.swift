//
//  MapAnnotation.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    // swiftlint:disable:next identifier_name
    var id: String
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?

    init(
        id: String,
        coordinate: CLLocationCoordinate2D,
        title: String? = nil,
        subtitle: String? = nil) {

        self.id = id
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
