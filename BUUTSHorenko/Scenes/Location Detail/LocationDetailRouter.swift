//
//  LocationDetailRouter.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 10/07/2025.
//

import UIKit

@objc protocol LocationDetailRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LocationDetailDataPassing {
    var dataStore: LocationDetailDataStore? { get }
}

class LocationDetailRouter: NSObject, LocationDetailRoutingLogic, LocationDetailDataPassing {
    weak var viewController: LocationDetailViewController?
    var dataStore: LocationDetailDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: LocationDetailViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: LocationDetailDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
