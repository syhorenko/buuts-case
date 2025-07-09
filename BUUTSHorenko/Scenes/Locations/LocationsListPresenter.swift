//
//  LocationsListPresenter.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

protocol LocationsListPresentationLogic {
    func presentFetchedLocations(response: LocationsList.FetchLocations.Response)
    func presentError(viewModel: LocationsList.FetchLocations.ViewModel)
}

class LocationsListPresenter: LocationsListPresentationLogic {
    weak var viewController: LocationsListDisplayLogic?
    
    func presentFetchedLocations(response: LocationsList.FetchLocations.Response) {
        let displayedLocations = response.locations.map {
            LocationsList.DisplayedLocation(
                name: $0.name ?? "<Unknown>",
                coordinates: "Lat: \(String(format: "%.4f", $0.latitude)), Lon: \(String(format: "%.4f", $0.longitude))"
            )
        }
        let viewModel = LocationsList.FetchLocations.ViewModel(
            displayedLocations: displayedLocations,
            error: nil
        )
        viewController?.displayFetchedLocations(viewModel: viewModel)
    }
    
    func presentError(viewModel: LocationsList.FetchLocations.ViewModel) {
        viewController?.displayError(viewModel: viewModel)
    }
}
