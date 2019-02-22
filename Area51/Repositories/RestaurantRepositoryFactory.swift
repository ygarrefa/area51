//
//  RestaurantRepositoryFactory.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

struct RestaurantRepositoryFactory {

    static func web() -> RestaurantWebRepository {
        return RestaurantWebRepository(
            httpClient: HTTPClient(),
            defaultHttpHeaders: [
                "Content-Type": "application/json",
                "Accept": "application/json; charset=utf-8"
            ])
    }
}
