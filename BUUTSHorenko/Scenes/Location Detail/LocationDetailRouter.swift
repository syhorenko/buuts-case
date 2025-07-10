//
//  LocationDetailRouter.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import UIKit

@objc protocol LocationDetailRoutingLogic {

}

protocol LocationDetailDataPassing {
    var dataStore: LocationDetailDataStore? { get }
}

class LocationDetailRouter: NSObject, LocationDetailRoutingLogic, LocationDetailDataPassing {
    weak var viewController: LocationDetailViewController?
    var dataStore: LocationDetailDataStore?
}
