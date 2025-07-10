//
//  LocationDetailInteractor.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import UIKit

protocol LocationDetailBusinessLogic {
    func loadLocationImage() async
}

protocol LocationDetailDataStore {
    var location: LocationDetail.DetailModel? { get set }
}

class LocationDetailInteractor: LocationDetailBusinessLogic, LocationDetailDataStore {
    var location: LocationDetail.DetailModel?
    var presenter: LocationDetailPresentationLogic?
    var worker: LocationDetailWorker?
    
    init(worker: LocationDetailWorker = LocationDetailWorker()) {
        self.worker = worker
    }
    
    func loadLocationImage() async {
        guard let presentedLocation = location else {
            let errorModel = LocationDetail.ErrorLocationImage(
                title: "Failed to load location image.",
                explanation: "No location provided"
            )
            let response = LocationDetail.LocationDetailModels.Response(locationImage: nil, error: errorModel)
            presenter?.presentError(response: response)
            return
        }
        
        do {
            let locationImage = try await worker?.loadLocationImage(latitude: presentedLocation.latitude, longitude: presentedLocation.longitude)
            
            let response = LocationDetail.LocationDetailModels.Response(locationImage: locationImage, error: nil)
            presenter?.presentLocationImage(response: response)
        } catch {
            let errorModel = LocationDetail.ErrorLocationImage(
                title: "Failed to load location image",
                explanation: error.localizedDescription
            )
            let response = LocationDetail.LocationDetailModels.Response(locationImage: nil, error: errorModel)
            presenter?.presentError(response: response)
        }
    }
}
