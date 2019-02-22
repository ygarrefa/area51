//
//  APIResult.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

/*
 Generic Tuple to be used as result of API calls
 - success: Any Decodable type
 - error: Any Error type
 */

public enum APIResult<Decodable, Error> {
    case success(Decodable)
    case failure(Error)
}
