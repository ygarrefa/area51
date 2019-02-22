//
//  Result.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

/*
 Generic Tuple to be used as result of async calls
 - success: Any Object type
 - error: Any Error type
 */

public enum Result<AnyObject, Error> {
    case success(AnyObject)
    case failure(Error)
}
