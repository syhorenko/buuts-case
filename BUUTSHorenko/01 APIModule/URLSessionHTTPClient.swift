//
//  URLSessionHTTPClient.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

public final class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func get(from url: URL) async throws -> (Data, HTTPURLResponse) {
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds for testing slow internet connection
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        return (data, httpResponse)
    }
}
