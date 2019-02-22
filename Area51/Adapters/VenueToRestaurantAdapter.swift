//
//  VenueToRestaurantAdapter.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

struct VenueToRestaurantAdapter {
    static func restaurant(from venue: VenueDTO) -> Restaurant {
        return Restaurant(
            id: venue.id,
            name: venue.name,
            address: venue.location.address ?? "",
            postalCode: venue.location.postalCode ?? "",
            city: venue.location.city ?? "",
            categories: venue.categories.map { $0.shortName },
            lat: venue.location.lat,
            lon: venue.location.lng,
            distance: venue.location.distance)
    }
}
