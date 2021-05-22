//
//  FriendsViewModelProtocol.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit


/// This protocol will execute in Friends Viewcontroller where it is implemented, after view model process any business logic related functionality or any api call sucess or failure .ViewModel calls this protocol and it shows its result on implemented view with specific functionality
protocol FriendsViewModelToViewController {
    var viewModel: FriendsViewControllerToViewModel? { get set }
    
    func updateView(for data: [FriendsInfo])
    
    func showError(for error: String)
    
    func loadingIndicator(isLoading: Bool)
}

/// Router class implemented this protocol , whenever FriendViewcontroller wants to navigate to another ViewController ,then FriendViewcontroller tells viewModel, viewModel will execute specific it function by using proper data
protocol FriendsViewModelToRouter {
    static func start() -> UINavigationController
    func showDetailViewController(from nav: UINavigationController, withData data: FriendsInfo)
}

/// FriendsViewModel implements this protocol to get any orders which needs to be executed for FriendsViewController 
protocol FriendsViewControllerToViewModel {
    var router: FriendsViewModelToRouter? { get set }
    
    var view: FriendsViewModelToViewController? { get set }
    
    func fetchData()
    
    func showDetailView(from nav: UINavigationController, withData data: FriendsInfo)
}
