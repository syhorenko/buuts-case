//
//  LocationDetailWorker.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import UIKit

class LocationDetailWorker {
    init() {
        
    }

    public func loadLocationImage(
        latitude: Double,
        longitude: Double,
        zoom: Int = 15,
        size: CGSize = CGSize(width: 300, height: 200)
    ) async throws -> UIImage {
        let client = URLSessionHTTPClient()
        var urlString = Constants.API.locationImageBaseString
        urlString += Constants.Locationiq.apiKey
        urlString += "&center=\(latitude),\(longitude)&zoom=14&size=600x300&markers=icon:large-red-cutout|\(latitude),\(longitude)"

        let loader = RemoteLocationImageLoader(
            url: URL(string: urlString)!,
            client: client
        )
        let data = try await loader.loadLocationImage(
            latitude: latitude,
            longitude: longitude,
            zoom: zoom,
            size: size
        )
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "LocationDetailWorker", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to decode image data"])
        }
        // TODO: Add caching of the image (or saving to DB)
        return image
    }
}
