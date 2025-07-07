//
//  LocationsLoader.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

public protocol LocationsLoader {
    func load() async throws -> [Location]
}
