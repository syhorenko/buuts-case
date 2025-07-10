//
//  LocationDetailPresenter.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import UIKit

protocol LocationDetailPresentationLogic {
    func presentLocationImage(response: LocationDetail.LocationDetailModels.Response)
    func presentError(response: LocationDetail.LocationDetailModels.Response)
}

class LocationDetailPresenter: LocationDetailPresentationLogic {
    weak var viewController: LocationDetailDisplayLogic?
    
    func presentLocationImage(response: LocationDetail.LocationDetailModels.Response) {
        viewController?.displayLocationImage(viewModel: LocationDetail.LocationDetailModels.ViewModel(locationImage: response.locationImage, error: response.error))
    }
    
    func presentError(response: LocationDetail.LocationDetailModels.Response) {
        viewController?.displayError(viewModel: LocationDetail.LocationDetailModels.ViewModel(locationImage: response.locationImage, error: response.error))
    }
}
