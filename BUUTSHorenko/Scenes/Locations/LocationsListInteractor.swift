//
//  LocationsListInteractor.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

protocol LocationsListBusinessLogic {
    func fetchLocations(request: LocationsList.FetchLocations.Request) async
}

protocol LocationsListDataStore {
    // var name: String { get set }
}

class LocationsListInteractor: LocationsListBusinessLogic, LocationsListDataStore {
    var presenter: LocationsListPresentationLogic?
    var worker: LocationsListWorker
    // var name: String = ""
    
    init(worker: LocationsListWorker = LocationsListWorker()) {
        self.worker = worker
    }
    
    func fetchLocations(request: LocationsList.FetchLocations.Request) async {
        do {
            let locations = try await worker.loadLocations()
            let responseLocations = locations.map {
                LocationsList.ResponsLocation(
                    name: $0.name,
                    latitude: $0.latitude,
                    longitude: $0.longitude
                )
            }
            let response = LocationsList.FetchLocations.Response(locations: responseLocations)
            presenter?.presentFetchedLocations(response: response)
        } catch {
            let errorModel = LocationsList.ErrorLocations(
                title: "Failed to load locations",
                explanation: error.localizedDescription
            )
            let emptyViewModel = LocationsList.FetchLocations.ViewModel(
                displayedLocations: [],
                error: errorModel
            )
            presenter?.presentError(viewModel: emptyViewModel)
        }
    }
}
