//
//  CombinedLocationsLoader.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation

public final class CombinedLocationsLoader: LocationsLoader {
    private let apiLoader: LocationsLoader
    private let dbLoader: LocationsLoader
    private let dbStoring: LocationsStoring
    private var allLocations: [Location] = []
    
    public init(apiLoader: LocationsLoader, dbLoader: LocationsLoader, dbStoring: LocationsStoring) {
        self.apiLoader = apiLoader
        self.dbLoader = dbLoader
        self.dbStoring = dbStoring
    }
    
    public func load() async throws -> [Location] {
        // TODO: Possible imrovment. Show stored items if we have so user see without waiting stored items and meanwhile load from API
        // First we try to make API call to fetch the most recent Locations and store them to DB
        do {
            allLocations = try await apiLoader.load()
            
            try? await dbStoring.store([]) // temporary cleanup
            try? await dbStoring.store(allLocations)
        } catch {
            debugPrint("API loading failed: \(error), trying to load from DB...")
            // If API call fails return stored items
            do {
                allLocations = try await dbLoader.load()
            } catch {
                debugPrint("DB loading also failed: \(error)")
            }
        }
        
        return allLocations
    }
}
