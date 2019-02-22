//
//  RestaurantDetailsViewControllerFactory.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

struct RestaurantDetailsViewControllerFactory {
    static func assemble(with restaurant: Restaurant) -> RestaurantDetailsViewController {
        let viewModel = RestaurantDetailsViewModel(restaurant: restaurant)
        return RestaurantDetailsViewController(viewModel: viewModel)
    }
}
