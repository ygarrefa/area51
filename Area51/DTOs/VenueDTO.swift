//
//  VenueDTO.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

struct VenueDTO: Codable {
    // swiftlint:disable:next identifier_name
    let id: String
    let name: String
    let location: VenueLocationDTO
    let categories: [VenueCategoryDTO]
}
