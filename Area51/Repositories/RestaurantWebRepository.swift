//
//  RestaurantWebRepository.swift
//  Area51
//
//  Created by Alex Garrefa on 21/02/2019.
//

import Foundation

final class RestaurantWebRepository: RestaurantRepositoryProtocol {

    public let defaultHttpHeaders: [String: String]
    private let httpClient: HTTPClientProtocol

    private static let baseURLPath = "https://api.foursquare.com/v2/venues/search"

    public init(
        httpClient: HTTPClientProtocol,
        defaultHttpHeaders: [String: String]) {

        self.httpClient = httpClient
        self.defaultHttpHeaders = defaultHttpHeaders
    }

    func getRestaurantsAt(
        lat: Double,
        lon: Double,
        completion: @escaping (Result<[Restaurant], Error>) -> Void) {

        getVenuesAt(lat: lat, lon: lon) { result in
            switch result {
            case .success(let dto):
                let restaurants = (dto.response.venues ?? [])
                    .map { VenueToRestaurantAdapter.restaurant(from: $0) }
                completion(Result.success(restaurants))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }

    private func getVenuesAt(
        lat: Double,
        lon: Double,
        completion: @escaping (Result<GetVenuesResponseDTO, Error>) -> Void) {

        // In a real world the credentials should be stored in a secure way
        // environment variable in the build machine, cocoapods-keys or other methods

        let queryString = queryStringFrom([
            ("client_id", "CLIENT_ID"),
            ("client_secret", "CLIENT_SECRET"),
            ("ll", "\(lat),\(lon)"),
            ("limit", "10"),
            ("v", "20180323"),
            ("categoryId", "4d4b7105d754a06374d81259"),
            ("radius", "500")
        ])

        var absolteURL = RestaurantWebRepository.baseURLPath
        if let query = queryString { absolteURL.append("?\(query)") }
        guard let url = URL(string: absolteURL) else {
            let error = NetworkError.invalidURL(absoluteURLPath: absolteURL)
            return completion(Result.failure(error))
        }

        let config = URLRequestConfig(
            method: .GET,
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData,
            httpHeaders: defaultHttpHeaders)

        performRequest(config, completion: completion)
    }
}

extension RestaurantWebRepository {

    private func queryStringFrom(_ queryItems: [(String, String?)?]) -> String? {
        return queryItems
            .compactMap { item -> String? in
                guard let item = item else { return nil }
                let (key, value) = item
                return "\(key)=\(value ?? "")"
            }.joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

    private func performRequest<T: Decodable>(
        _ config: URLRequestConfig,
        completion: @escaping (Result<T, Error>) -> Void) {

        debugPrint(config)

        httpClient.performRequest(config: config) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                DispatchQueue.main.async {
                    let genError = NetworkError.generic(originalError: error)
                    return completion(Result.failure(genError))
                }
            }

            guard (response as? HTTPURLResponse) != nil else {
                DispatchQueue.main.async {
                    let netError = NetworkError.networkDown
                    completion(Result.failure(netError))
                }
                return
            }

            guard let data = data else {
                completion(Result.failure(NetworkError.dataCorrupted))
                return
            }

            do {
                let decoder = self.jsonDecoder()
                let model = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    return completion(Result.success(model))
                }
            } catch let error {
                DispatchQueue.main.async {
                    let dump = String(bytes: data, encoding: .utf8) ?? "emtpy response"
                    debugPrint(dump)
                    let netError = NetworkError.generic(originalError: error)
                    return completion(Result.failure(netError))
                }
            }
        }
    }

    private func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}
