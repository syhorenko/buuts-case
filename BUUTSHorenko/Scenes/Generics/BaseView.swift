//
//  BaseView.swift
//  BUUTSHorenko
//
//  Created by Serhii Horenko on 08/07/2025.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    // MARK: - UIView
    
    public init() {
        super.init(frame: .zero)
        
        initView()
        addSubviews()
        setupConstraints()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewLayoutProtocol
    
    internal func initView() { }
    
    internal func addSubviews() { }
    
    internal func setupConstraints() { }
}
