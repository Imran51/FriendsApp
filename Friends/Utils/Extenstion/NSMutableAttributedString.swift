//
//  NSMutableAttributedString.swift
//  Friends
//
//  Created by Imran Sayeed on 22/5/21.
//

import UIKit

extension NSMutableAttributedString {

    func formatFontWeight(_ value: String, isStringBold stringBold: Bool = false, withFonSize fontSize: CGFloat = 17, withFontColor fontColor: UIColor = .label, isItalicStyleEnabled italicStyleEnabled:Bool = false) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        let font = stringBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        attributes = [.font: (italicStyleEnabled ? font.italics() : font), .foregroundColor: fontColor]

        self.append(NSAttributedString(string: value, attributes: attributes))

        return self
    }
}
