//
//  BaseViewController.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko | CM.com on 08/07/2025.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildView()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepare(for: segue)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        applyTheme(isDark: traitCollection.userInterfaceStyle == .dark)
    }

    internal func prepare(for segue: UIStoryboardSegue) { }
    internal func buildView() { }
    internal func applyTheme(isDark: Bool) { }

    internal func setup() { }
    internal func loadData() { }
}
