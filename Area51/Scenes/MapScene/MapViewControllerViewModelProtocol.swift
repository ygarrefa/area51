//
//  MapViewControllerViewModelProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 22/02/2019.
//

import Foundation

protocol MapViewControllerViewModelProtocol {
    var restaurants: [Restaurant] { get set }
    var updateRestaurantsCallback: ([Restaurant]) -> Void { get set }
    func visibleAreaDidChangeTo(lat: Double, lon: Double)
}
