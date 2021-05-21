//
//  FriendsViewControllerRouter.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsViewControllerRouter: FriendsViewModelToRouter {
    func showDetailViewController(from nav: UINavigationController, withData data: FriendsInfo) {
        let detailsViewRouter = FriendsDetailViewControllerRouter()
        detailsViewRouter.showViewController(from: nav, withData: data)
    }
    
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
}
