//
//  LocationsMapper.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import Foundation

internal enum LocationsMapper {
    private struct Root: Decodable {
        let locations: [Item]
        
        var locationsList: [Location] {
            return locations.map { $0.item }
        }
    }
    
    private struct Item: Decodable {
        let name: String?
        let latitude: Double
        let longitude: Double

        enum CodingKeys: String, CodingKey {
            case name
            case latitude = "lat"
            case longitude = "long"
        }
        
        var item: Location {
            return Location(name: name, latitude: latitude, longitude: longitude)
        }
    }

    static var OK200: Int { return 200 }

    internal static func map(_ data: Data, from response: HTTPURLResponse) throws (RemoteLocationsLoader.Error) -> ([Location]) {
        guard response.statusCode == OK200 else {
            throw RemoteLocationsLoader.Error.connectivity
        }

        let decoder = JSONDecoder()

        do {
            let root = try decoder.decode(Root.self, from: data)
            
            return root.locationsList
        } catch {
            if let jsonString = String(data: data, encoding: .utf8) {
                debugPrint("Failed to decode JSON: \(jsonString)")
            }
            debugPrint("Decoding error: \(error)")
            throw RemoteLocationsLoader.Error.invalidData
        }
    }
}
