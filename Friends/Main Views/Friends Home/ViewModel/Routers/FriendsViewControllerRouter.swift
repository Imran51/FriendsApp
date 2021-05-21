//
//  FriendsViewControllerRouter.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsViewControllerRouter {
    static func start() -> UINavigationController {
        let viewModel = FriendsViewModel()
        let viewController = FriendsViewController(viewModel: viewModel)
        viewController.title = "Friends List"
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.prefersLargeTitles = true
        
        return nav
    }
}
