//
//  HTTPClient.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL) async throws -> (Data, HTTPURLResponse)
}
