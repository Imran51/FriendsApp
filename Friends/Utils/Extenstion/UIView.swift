//
//  UIView.swift
//  Friends
//
//  Created by Imran Sayeed on 22/5/21.
//

import UIKit

extension UIStackView {
    func addArrangedSubViews(_ views: UIView...) {
        views.forEach{
            addArrangedSubview($0)
        }
    }
}
