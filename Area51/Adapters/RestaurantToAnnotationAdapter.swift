//
//  RestaurantToAnnotationAdapter.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation
import CoreLocation

struct RestaurantToAnnotationAdapter {
    static func annotation(for restaurant: Restaurant) -> MapAnnotation {
        let location = CLLocationCoordinate2D(
            latitude: restaurant.lat,
            longitude: restaurant.lon)
        return MapAnnotation(
            id: restaurant.id,
            coordinate: location,
            title: restaurant.name,
            subtitle: restaurant.categories.first)
    }
}
