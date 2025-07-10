//
//  LocationDetailView.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 10/07/2025.
//

import Foundation
import UIKit

internal class LocationDetailView: BaseView {

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

    func setMapImage(latitude: Double, longitude: Double, zoom: Int = 15, size: CGSize = CGSize(width: 300, height: 200)) {
        showSpinner()

        let apiKey = "YOUR_GOOGLE_MAPS_API_KEY"
        let urlString = "https://maps.googleapis.com/maps/api/staticmap?center=\(latitude),\(longitude)&zoom=\(zoom)&size=\(Int(size.width))x\(Int(size.height))&markers=color:red|\(latitude),\(longitude)&key=\(apiKey)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            hideSpinner()
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.hideSpinner()
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.mapImageView.image = image
                }
            } else {
                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }

    func showSpinner() {
        spinner.startAnimating()
    }

    func hideSpinner() {
        spinner.stopAnimating()
    }
}
