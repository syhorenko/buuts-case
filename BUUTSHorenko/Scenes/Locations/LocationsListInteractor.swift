//
//  LocationsListInteractor.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

protocol LocationsListBusinessLogic {

}

protocol LocationsListDataStore {
    // var name: String { get set }
}

class LocationsListInteractor: LocationsListBusinessLogic, LocationsListDataStore {
    var presenter: LocationsListPresentationLogic?
    var worker: LocationsListWorker?
    // var name: String = ""
}
