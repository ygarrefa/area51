//
//  NetworkError.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

enum NetworkError: Error {
    case networkDown
    case dataCorrupted
    case invalidURL(absoluteURLPath: String)
    case generic(originalError: Error)
}

enum GenericError: Error {
    case generic(message: String)
}
