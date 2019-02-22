//
//  URLSessionProtocol.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

public typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
