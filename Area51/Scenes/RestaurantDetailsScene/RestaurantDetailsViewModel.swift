//
//  RestaurantDetailsViewModel.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

class RestaurantDetailsViewModel: RestaurantDetailsViewModelProtocol {

    private let restaurant: Restaurant

    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }

    var name: String {
        return restaurant.name
    }

    var address: String {
        return [
            restaurant.address,
            restaurant.postalCode,
            restaurant.city
            ].joined(separator: ", ")
    }

    var categories: String {
        return restaurant.categories.joined(separator: ", ")
    }

    var distance: String {
        return "\(restaurant.distance) meters"
    }
}
