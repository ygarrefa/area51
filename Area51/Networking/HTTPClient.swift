//
//  HTTPClient.swift
//  Area51
//
//  Created by Alex Garrefa on 20/02/2019.
//

import Foundation

public final class HTTPClient: HTTPClientProtocol {
    let session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    @discardableResult public func performRequest(
        config: URLRequestConfig,
        completion: @escaping DataTaskResult) -> URLSessionDataTask {

        let request = createURLRequest(config: config)
        let task = session.dataTask(with: request, completionHandler: completion)
        task.resume()
        return task
    }

    internal func createURLRequest(
        config: URLRequestConfig) -> URLRequest {

        let cachePolicy: URLRequest.CachePolicy = {
            // Only cache GET requests
            guard config.method == .GET else { return .useProtocolCachePolicy }
            return config.cachePolicy
        }()

        warnIfCachePolicyIsNotImplemented(cachePolicy)

        var request = URLRequest(
            url: config.url,
            cachePolicy: cachePolicy,
            timeoutInterval: config.timeout)

        request.httpMethod = config.method.rawValue
        request.allHTTPHeaderFields = config.httpHeaders

        return request
    }
}

private extension HTTPClient {
    private func warnIfCachePolicyIsNotImplemented(
        _ cachePolicy: URLRequest.CachePolicy) {

        // Reminder of cache policy values that are not implemented
        // Ref: https://nshipster.com/nsurlcache/

        let notImplemented: [URLRequest.CachePolicy] = [
            .reloadIgnoringLocalAndRemoteCacheData,
            .reloadRevalidatingCacheData
        ]
        guard notImplemented.contains(cachePolicy) else { return }
        debugPrint(
            "Cache policy selected was not implemented by Apple:",
            "http://openradar.appspot.com/radar?id=1755401")
    }
}
