//
//  LocationDetailViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 10/07/2025.
//

import UIKit

protocol LocationDetailDisplayLogic: AnyObject {
}

class LocationDetailViewController: BaseViewController, LocationDetailDisplayLogic {
    var interactor: LocationDetailBusinessLogic?
    var router: (NSObjectProtocol & LocationDetailRoutingLogic & LocationDetailDataPassing)?
    
    override var screenTitle: String { "" }
    
    internal lazy var customView: LocationDetailView = {
        let view = LocationDetailView()
        return view
    }()
    
    override func buildView() {
        self.view = customView
        
        setTitle(router?.dataStore?.location?.name ?? "<Unknown>")
    }
    
    override func applyTheme(isDark: Bool) { }
    
    override func loadData() {
        Task {
            customView.showSpinner()
        }
    }
    
    // MARK: Setup
    
    override func setup() {
        let viewController = self
        let interactor = LocationDetailInteractor()
        let presenter = LocationDetailPresenter()
        let router = LocationDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
}
