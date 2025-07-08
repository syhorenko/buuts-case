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
}
