//
//  UIImageView.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

extension UIImageView {
    func round(cornerRadius: CGFloat, borderWidth: CGFloat = 1, borderColor: UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
