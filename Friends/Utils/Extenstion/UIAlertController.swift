//
//  UIAlertController.swift
//  ssf_apps
//
//  Created by Mac  on 8/7/19.
//  Copyright © 2019 Mac . All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func alertDialog(
        _ message: String? = nil, title: String? = nil,
        buttonTitle: String = "OK",
        buttonActionHandler: ((UIAlertAction) -> Void)? = nil
    ) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: buttonActionHandler)
        alert.addAction(okAction)
        
        return alert
    }
}
