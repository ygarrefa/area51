//
//  MapViewControllerFactory.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

struct MapViewControllerFactory {
    static func assemble(with startLocation: Location? = nil) -> MapViewController {
        let repository = RestaurantRepositoryFactory.web()
        let viewModel = MapViewControllerViewModel(repository: repository)
        return MapViewController(
            startLocation: startLocation,
            viewModel: viewModel)
    }
}
