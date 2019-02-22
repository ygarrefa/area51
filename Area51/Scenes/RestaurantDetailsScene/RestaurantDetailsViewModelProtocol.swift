//
//  RestaurantDetailsViewModelProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

protocol RestaurantDetailsViewModelProtocol {
    var name: String { get }
    var address: String { get }
    var categories: String { get }
    var distance: String { get }
}
