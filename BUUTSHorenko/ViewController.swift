//
//  ViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 07/07/2025.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            await loadData()
        }
    }
    
    private func loadData() async {
        let client = URLSessionHTTPClient()
        let remoteLoader = RemoteLocationsLoader(
            url: URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json")!,
            client: client
        )
        let dbLoader = DBLocationsLoader()
        let dbStoring = DBLocationsStoring()
        
        let combinedLoader = CombinedLocationsLoader(apiLoader: remoteLoader, dbLoader: dbLoader, dbStoring: dbStoring)
        do {
            let locations = try await combinedLoader.load()
            debugPrint("Locations: \(locations)")
        } catch {
            debugPrint("Failed to load locations: \(error)")
        }
    }
}
