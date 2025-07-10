//
//  LocationDetailInteractor.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 10/07/2025.
//

import UIKit

protocol LocationDetailBusinessLogic {
    
}

protocol LocationDetailDataStore {
    var location: LocationDetail.LocationDetailModel? { get set }
}

class LocationDetailInteractor: LocationDetailBusinessLogic, LocationDetailDataStore {
    var location: LocationDetail.LocationDetailModel?
    var presenter: LocationDetailPresentationLogic?
    var worker: LocationDetailWorker?
    //var name: String = ""
    
}
