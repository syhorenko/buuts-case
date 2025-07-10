//
//  BaseViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
        setTitle(screenTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setTitle(screenTitle)
    }
    
    internal var screenTitle: String {
        return ""
    }

    internal func setTitle(_ title: String) {
        self.title = title
        navigationItem.title = title
        
        let isDark = traitCollection.userInterfaceStyle == .dark
        let color = isDark ? UIColor.systemPurple : UIColor.systemBlue

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem

        navigationController?.navigationBar.tintColor = color

        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func loadView() {
        buildView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepare(for: segue)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        applyTheme(isDark: traitCollection.userInterfaceStyle == .dark)
    }
    
    internal func showErrorAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }

    internal func prepare(for segue: UIStoryboardSegue) { }
    internal func buildView() { }
    internal func applyTheme(isDark: Bool) { }

    internal func setup() { }
    internal func loadData() { }
}
