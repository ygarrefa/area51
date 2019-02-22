//
//  URLRequestConfig.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

public struct URLRequestConfig {
    public let method: HTTPMethod
    public let url: URL
    public let cachePolicy: URLRequest.CachePolicy
    public let timeout: TimeInterval
    public let httpHeaders: [String: String]

    public init(
        method: HTTPMethod,
        url: URL,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeout: TimeInterval = 60,
        httpHeaders: [String: String] = [:]) {

        self.method = method
        self.url = url
        self.cachePolicy = cachePolicy
        self.timeout = timeout
        self.httpHeaders = httpHeaders
    }
}
