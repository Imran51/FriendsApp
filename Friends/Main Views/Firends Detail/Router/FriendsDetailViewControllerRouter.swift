//
//  FriendsDetailViewControllerRouter.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsDetailViewControllerRouter: FriendsDetailViewModelToRouter {
    func showViewController(from nav: UINavigationController, withData data: FriendsInfo) {
        let detailsView = FriendsDetailViewControllerRouter.start()
        detailsView.updateView(for: data)
        nav.pushViewController(detailsView, animated: true)
        nav.navigationBar.prefersLargeTitles = true
    }
    
    static func start() -> FriendsDetailViewController {
        let router = FriendsDetailViewControllerRouter()
        var viewModel: FriendsDetailViewControllerToViewModel = FriendsDetailViewModel()
        let viewController = FriendsDetailViewController()
        viewController.title = "Detail Information"
        
        viewController.viewModel = viewModel
        viewModel.router = router
        viewModel.view = viewController
        
        return viewController
    }
    
}
