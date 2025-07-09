//
//  LocationsListWorker.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenk on 08/07/2025.
//

import UIKit

class LocationsListWorker {
    let loader: CombinedLocationsLoader

    init() {
        let client = URLSessionHTTPClient()
        let remoteLoader = RemoteLocationsLoader(
            url: Constants.API.locationsURL,
            client: client
        )
        let dbLoader = DBLocationsLoader()
        let dbStoring = DBLocationsStoring()
        
        let combinedLoader = CombinedLocationsLoader(apiLoader: remoteLoader, dbLoader: dbLoader, dbStoring: dbStoring)
        
        self.loader = combinedLoader
    }
    
    public func loadLocations() async throws -> [Location] {
        return try await loader.load()
    }
}
