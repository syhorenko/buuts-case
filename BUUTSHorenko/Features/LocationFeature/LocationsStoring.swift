//
//  LocationsStoring.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation

public protocol LocationsStoring {
    func store(_ locations: [Location]) async throws
}
