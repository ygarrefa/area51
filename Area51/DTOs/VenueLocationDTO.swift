//
//  VenueLocationDTO.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

struct VenueLocationDTO: Codable {
    let address: String?
    let postalCode: String?
    let city: String?
    let lat: Double
    let lng: Double
    let distance: Double
}
