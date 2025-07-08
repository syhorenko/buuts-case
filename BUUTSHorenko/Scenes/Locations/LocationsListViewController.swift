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
    
    private var locations: [Location] = []
    
    override var screenTitle: String { "Locations" }
    
    internal lazy var customView: LocationsView = {
        let view = LocationsView()
        view.delegate = self
        return view
    }()

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
    
    // MARK: - Setup UI
    
    override func buildView() {
        self.view = customView
    }
    
    override func applyTheme(isDark: Bool) { }
    
    // MARK: - Setup Data
    
    override func loadData() {
        locations = [
            Location(name: "Amsterdam", latitude: 52.3547, longitude: 4.8339),
            Location(name: "Mumbai", latitude: 19.0824, longitude: 72.8111),
            Location(name: "Copenhagen", latitude: 55.6713, longitude: 12.5237)
        ]
        customView.reloadTable()
    }
}

// MARK: - LocationTableView Conformance

extension LocationsListViewController: LocationTableView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as? LocationCell else {
            return UITableViewCell()
        }
        let location = locations[indexPath.row]
        cell.configure(with: location)
        return cell
    }
}
