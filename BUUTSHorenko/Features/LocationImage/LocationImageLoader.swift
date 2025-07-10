//
//  LocationImageLoader.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import Foundation

public protocol LocationImageLoader {
    func loadLocationImage(latitude: Double, longitude: Double, zoom: Int, size: CGSize) async throws -> Data
}
