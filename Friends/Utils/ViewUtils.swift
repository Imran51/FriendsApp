//
//  ViewUtils.swift
//  Friends
//
//  Created by Imran Sayeed on 22/5/21.
//

import UIKit

public class ViewUtils {
    public static func customStackview(
        withSpacing spacing: CGFloat,
        withAxis axis: NSLayoutConstraint.Axis) -> UIStackView {

        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = axis
        stackView.spacing = spacing

        return stackView
    }

    public static func verticalSpacerView() -> UIView {
        let spacer = UIView()
        let constraint = spacer.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow

        return spacer
    }

    public static func horizontalSpacerView() -> UIView {
        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow

        return spacer
    }

    public static func customLabel(background: UIColor = .white, alignment: NSTextAlignment = .left ,height: CGFloat = 50.0) -> UILabel {
        let label = PaddingLabel()
        label.padding(0, 0, 15, 15)
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: height).isActive = true
        label.backgroundColor = background
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textColor = .label

        return label
    }
    
    public static func verticalSeparatorView() -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .separator

        return view
    }
    
    public static func unSuccessfulAlert(_ message: String) -> UIAlertController {

        return UIAlertController.alertDialog(message, title: nil)
    }
}
