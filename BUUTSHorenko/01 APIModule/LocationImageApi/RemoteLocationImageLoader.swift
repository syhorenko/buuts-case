//
//  RemoteLocationImageLoader.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko 10/07/2025.
//

import Foundation

public final class RemoteLocationImageLoader: LocationImageLoader {
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
    
    public func loadLocationImage(latitude: Double, longitude: Double, zoom: Int, size: CGSize) async throws -> Data {
        let (data, response) = try await client.get(from: url)
        
        // TODO: Parse response here. If error - throw an error
        
        return data
    }

}
