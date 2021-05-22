//
//  FriendsViewControllerRouter.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

/// FriendsViewControllerRouter is an entry point for opening FriendsViewController to show its UI elements and respective functionality. This class is also used for navigating to other viewcontrollers
class FriendsViewControllerRouter: FriendsViewModelToRouter {
    static func start() -> UINavigationController {
        let router = FriendsViewControllerRouter()
        var viewModel: FriendsViewControllerToViewModel = FriendsViewModel()
        let viewController = FriendsViewController()
        viewController.title = "Friends List"
        
        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.prefersLargeTitles = true
        
        viewController.viewModel = viewModel
        
        viewModel.router = router
        viewModel.view = viewController
        
        
        return nav
    }
    
    func showDetailViewController(from nav: UINavigationController, withData data: FriendsInfo) {
        let detailsViewRouter = FriendsDetailViewControllerRouter()
        detailsViewRouter.showViewController(from: nav, withData: data)
    }
}
