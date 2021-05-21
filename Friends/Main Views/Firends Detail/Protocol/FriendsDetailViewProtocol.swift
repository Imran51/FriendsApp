//
//  FriendsDetailViewProtocol.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

protocol FriendsDetailViewModelToViewController {
    var viewModel: FriendsDetailViewControllerToViewModel? { get set }
    
    func updateView(for data: FriendsInfo)
}

protocol FriendsDetailViewModelToRouter {
    static func start() -> FriendsDetailViewController
    
    func showViewController(from nav: UINavigationController, withData data: FriendsInfo)
}

protocol FriendsDetailViewControllerToViewModel {
    var router: FriendsDetailViewModelToRouter? { get set }
    
    var view: FriendsDetailViewModelToViewController? { get set }
    
    func getData()
}
