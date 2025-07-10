//
//  LocationsListRouter.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

@objc protocol LocationsListRoutingLogic {
    func routeToLocationDetail(selectedLocationId: String)
}

protocol LocationsListDataPassing {
    var dataStore: LocationsListDataStore? { get }
}

class LocationsListRouter: NSObject, LocationsListRoutingLogic, LocationsListDataPassing {
    weak var viewController: LocationsListViewController?
    var dataStore: LocationsListDataStore?
    
    // MARK: Routing
    
    func routeToLocationDetail(selectedLocationId: String){
        let destinationVC = LocationDetailViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToLocationDetail(selectedLocationId: selectedLocationId, destination: &destinationDS)
        navigateToLocationDetail(source: viewController!, destination: destinationVC)
    }

    private func navigateToLocationDetail(source: LocationsListViewController, destination: LocationDetailViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    private func passDataToLocationDetail(selectedLocationId: String, destination: inout LocationDetailDataStore) {
        guard let selectedLocation = dataStore?.selectedLocation.first(where: { $0.id == selectedLocationId }) else { return }
        // TODO: LocationsList.DisplayedLocation should not contain latitude, longitude it should operate with id. When DB is implemented rework it.
        let locationDetail = LocationDetail.LocationDetailModel(id: selectedLocation.id, name: selectedLocation.name, latitude: selectedLocation.latitude, longitude: selectedLocation.longitude)
        
        destination.location = locationDetail
    }
}
