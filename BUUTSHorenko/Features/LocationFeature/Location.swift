//
//  Location.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

public struct Location: Equatable, Hashable {
    public let name: String?
    public let latitude: Double
    public let longitude: Double
    
    public init(name: String?, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
