//
//  CardView.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import Foundation
import UIKit

class CardView: UIView {
    
    var defaultCornerRadiusValue: CGFloat = 10.0
    
    var cornerRadius: CGFloat {
        get {
            return self.defaultCornerRadiusValue
        }
        set {
            self.defaultCornerRadiusValue = newValue
        }
    }
    
    var shadowOfSetWidth: CGFloat = 1
    var shadowOfSetHeight: CGFloat = 2

    var shadowColour: UIColor = ViewUtils.isDarkUserInterface() ? .lightGray : .darkGray
    var shadowOpacity: CGFloat = 0.4

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColour.cgColor
        layer.shadowOffset = CGSize(width: shadowOfSetWidth, height: shadowOfSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity)
    }
}
