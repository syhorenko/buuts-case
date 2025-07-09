//
//  LocationsView.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation
import UIKit

internal protocol LocationTableView: UITableViewDelegate, UITableViewDataSource {}

internal class LocationsView: BaseView {
    internal weak var delegate: LocationTableView? {
        didSet {
            tableView.delegate = delegate
            tableView.dataSource = delegate
        }
    }
    
    private let spinner: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(LocationCell.self, forCellReuseIdentifier: "LocationCell")
        
        return tableView
    }()
    
    // MARK: - BaseView overrides
    
    override func initView() {
        backgroundColor = .systemBackground
        tableView.backgroundColor = .clear
    }
    
    override func addSubviews() {
        addSubview(tableView)
        addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showSpinner() {
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.stopAnimating()
    }
}
