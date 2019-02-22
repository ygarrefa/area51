//
//  HTTPMethod.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

public enum HTTPMethod: String, Codable, CaseIterable {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}
