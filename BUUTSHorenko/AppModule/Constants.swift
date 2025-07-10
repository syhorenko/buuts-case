//
//  Constants.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 09/07/2025.
//

import Foundation

enum Constants {
    enum Locationiq {
        static let apiKey = "pk.324b16f05a2da294a9e638f7d50cec6b"
    }
    enum API {
        static let locationsURL = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")!
        static let locationImageBaseString = "https://maps.locationiq.com/v3/staticmap?key="

    }
}
