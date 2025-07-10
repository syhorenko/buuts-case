//
//  LocationDetailModels.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 10/07/2025.
//

import UIKit

enum LocationDetail {
    // MARK: Use cases
    
    enum LocationDetailModels {
        struct Request {
        }
        struct Response {
            let locationImage: UIImage?
            let error: ErrorLocationImage?
        }
        struct ViewModel {
            let locationImage: UIImage?
            let error: ErrorLocationImage?
        }
    }
    
    struct DetailModel {
        let id: String
        let name: String?
        let latitude: Double
        let longitude: Double
    }
    struct ErrorLocationImage {
        let title: String
        let explanation: String
    }
}
