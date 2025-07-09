//
//  LocationCell.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation
import UIKit

internal final class LocationCell: UITableViewCell {

    private let cellView = LocationCellView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        backgroundColor = .clear
        selectionStyle = .none
    }

    internal func configure(with location: LocationsList.DisplayedLocation) {
        cellView.configure(with: location)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        cellView.traitCollectionDidChange(previousTraitCollection)
    }
}
