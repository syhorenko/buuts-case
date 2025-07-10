//
//  LocationsListModels.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import UIKit

enum LocationsList {
    // MARK: Use Cases

    enum FetchLocations {
        struct Request {
        }

        struct Response {
            let locations: [ResponsLocation]
        }

        struct ViewModel {
            let displayedLocations: [DisplayedLocation]
            let error: ErrorLocations?
        }
    }

    struct ResponsLocation {
        let id: String
        let name: String?
        let latitude: Double
        let longitude: Double
    }
    
    struct DisplayedLocation {
        let id: String
        let name: String
        let coordinates: String
    }
    
    struct ErrorLocations {
        let title: String
        let explanation: String
    }
}
