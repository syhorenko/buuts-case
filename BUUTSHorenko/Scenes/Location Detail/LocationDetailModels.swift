//
//  LocationDetailModels.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 10/07/2025.
//

import UIKit

enum LocationDetail
{
    // MARK: Use cases
    
    enum LocationDetailModels
    {
        struct Request
        {
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
    
    struct LocationDetailModel {
        let id: String
        let name: String?
        let latitude: Double
        let longitude: Double
    }
}
