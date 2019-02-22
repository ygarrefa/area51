//
//  HTTPClientProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

public protocol HTTPClientProtocol {
    @discardableResult func performRequest(
        config: URLRequestConfig,
        completion: @escaping DataTaskResult) -> URLSessionDataTask
}
