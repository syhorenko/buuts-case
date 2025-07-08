//
//  LocationCellView.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation
import UIKit

internal final class LocationCellView: BaseView {

    private let nameLabel = UILabel()
    private let coordsLabel = UILabel()

    override func initView() {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        coordsLabel.font = UIFont.systemFont(ofSize: 14)
        coordsLabel.numberOfLines = 1
        applyTheme()
    }

    override func addSubviews() {
        addSubview(nameLabel)
        addSubview(coordsLabel)
    }

    override func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        coordsLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            coordsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            coordsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            coordsLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            coordsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    internal func configure(with location: Location) {
        nameLabel.text = location.name
        coordsLabel.text = "Lat: \(location.latitude), Long: \(location.longitude)"
        
    }

    private func applyTheme() {
        let darkMode = traitCollection.userInterfaceStyle == .dark
        backgroundColor = darkMode ? .black : .white
        nameLabel.textColor = darkMode ? .systemPurple : .systemBlue
        coordsLabel.textColor = darkMode ? .lightGray : .darkGray
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        applyTheme()
    }
}
