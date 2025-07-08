//
//  LocationsListViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

protocol LocationsListDisplayLogic: AnyObject {
    
}

class LocationsListViewController: BaseViewController, LocationsListDisplayLogic {
    var interactor: LocationsListBusinessLogic?
    var router: (NSObjectProtocol & LocationsListRoutingLogic & LocationsListDataPassing)?

    // MARK: Setup
    
    override func setup() {
        let viewController = self
        let interactor = LocationsListInteractor()
        let presenter = LocationsListPresenter()
        let router = LocationsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Setup UI
    
    override func buildView() { }
    override func applyTheme(isDark: Bool) { }
    
    // MARK: - Setup Data
    
    override func loadData() { }
}
