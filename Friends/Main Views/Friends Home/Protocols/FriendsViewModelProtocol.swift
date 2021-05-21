//
//  FriendsViewModelProtocol.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

protocol FriendsViewModelToViewController {
    var viewModel: FriendsViewControllerToViewModel? { get set }
    
    func updateView(for data: [FriendsInfo])
    
    func showError(for error: String)
}

protocol FriendsViewModelToRouter {
    static func start() -> UINavigationController
    func showDetailViewController(from nav: UINavigationController, withData data: FriendsInfo)
}

protocol FriendsViewControllerToViewModel {
    var router: FriendsViewModelToRouter? { get set }
    
    var view: FriendsViewModelToViewController? { get set }
    
    func fetchData()
    
    func showDetailView(from nav: UINavigationController, withData data: FriendsInfo)
}
