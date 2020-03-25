//
//  XibView.swift
//  Soap
//
//  Created by Trevin Wisaksana on 25/03/20.
//  Copyright © 2020 Trevin Wisaksana. All rights reserved.
//

import UIKit

/// Enables  nib files to be visible in Storyboards.
@IBDesignable
open class XibView: UIView {
    
    public var contentView: UIView?
    
    // MARK: - Setup
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
        contentView?.prepareForInterfaceBuilder()
    }
    
    private func setup() {
        guard let view = loadViewFromNib() else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
