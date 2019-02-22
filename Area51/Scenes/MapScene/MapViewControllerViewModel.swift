//
//  MapViewControllerViewModel.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

class MapViewControllerViewModel: MapViewControllerViewModelProtocol {

    var restaurants: [Restaurant] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.updateRestaurantsCallback(self.restaurants)
            }
        }
    }

    private let repository: RestaurantRepositoryProtocol

    var updateRestaurantsCallback: ([Restaurant]) -> Void = { _ in }

    init(repository: RestaurantRepositoryProtocol) {
        self.repository = repository
    }

    func visibleAreaDidChangeTo(lat: Double, lon: Double) {
        repository.getRestaurantsAt(lat: lat, lon: lon) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                self.restaurants = restaurants
            case .failure(let error):
                // Need to handle errors in the next sprint :)
                debugPrint(error)
            }
        }
    }
}
