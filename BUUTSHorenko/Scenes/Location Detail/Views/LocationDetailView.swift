//
//  LocationDetailView.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import Foundation
import UIKit

internal class LocationDetailView: BaseView {
    private var currentAngleY: CGFloat = 0

    private let mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let spinner: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    // MARK: - BaseView overrides

    override func initView() {
        backgroundColor = .systemBackground
    }

    override func addSubviews() {
        addSubview(mapImageView)
        addSubview(spinner)
    }

    override func setupConstraints() {
        NSLayoutConstraint.activate([
            mapImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mapImageView.widthAnchor.constraint(equalToConstant: 300),
            mapImageView.heightAnchor.constraint(equalToConstant: 200),

            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Public Methods

    func setMapImage(_ image: UIImage) {
        mapImageView.image = image
    }

    func showSpinner() {
        spinner.startAnimating()
    }

    func hideSpinner() {
        spinner.stopAnimating()
    }
    
}
