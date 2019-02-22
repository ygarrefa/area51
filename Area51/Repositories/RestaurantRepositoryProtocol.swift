//
//  RestaurantRepositoryProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

protocol RestaurantRepositoryProtocol {
    func getRestaurantsAt(
        lat: Double,
        lon: Double,
        completion: @escaping (Result<[Restaurant], Error>) -> Void)
}
