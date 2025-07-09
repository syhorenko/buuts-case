//
//  LocationsListViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

protocol LocationsListDisplayLogic: AnyObject {
    func displayFetchedLocations(viewModel: LocationsList.FetchLocations.ViewModel)
    func displayError(viewModel: LocationsList.FetchLocations.ViewModel)
}

class LocationsListViewController: BaseViewController, LocationsListDisplayLogic {
    var interactor: LocationsListBusinessLogic?
    var router: (NSObjectProtocol & LocationsListRoutingLogic & LocationsListDataPassing)?
    
    private var locations: [LocationsList.DisplayedLocation] = []
    
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
        Task {
            customView.showSpinner()
            await interactor?.fetchLocations(request: LocationsList.FetchLocations.Request())
        }
        
    }
    
    func displayFetchedLocations(viewModel: LocationsList.FetchLocations.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.customView.hideSpinner()
            self?.locations = viewModel.displayedLocations
            self?.customView.reloadTable()
        }
    }
    
    func displayError(viewModel: LocationsList.FetchLocations.ViewModel) {
        if let error = viewModel.error {
            self.showErrorAlert(
                title: error.title,
                message: error.explanation
            )
            return
        }
    }
    
    private func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
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
