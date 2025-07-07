//
//  RemoteLocationsLoader.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

public final class RemoteLocationsLoader: LocationsLoader {
    private let client: HTTPClient
    private let url: URL

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load() async throws -> [Location] {
        let (data, response) = try await client.get(from: url)
        let locations = try LocationsMapper.map(data, from: response)
        
        return locations
    }
}
