//
//  friendsViewModel.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

/// This is the main and all business logic goes here , View controller knows only the ViewModel all api interaction and other stuff goes here.
class FriendsViewModel: FriendsViewControllerToViewModel {
    
    var router: FriendsViewModelToRouter?
    
    var view: FriendsViewModelToViewController?
    
    private let service: NetworkService = NetworkService.shared
    
    func fetchData() {
        view?.loadingIndicator(isLoading: true)
        let numberOfRequiredData = 10
        let urlParameter = "?results=\(numberOfRequiredData)"
        guard let url = URL(string: URLPathConstant.friendsUrl+urlParameter) else {
            view?.showError(for: "URL can be not constructed properly.")
            return
        }
        
        service.fetchData(for: url, completion: {[weak self] (result: Result<FriendsModel,Error>) in
            switch result {
            case .success(let model):
                self?.view?.updateView(for: model.results)
                self?.view?.loadingIndicator(isLoading: false)
            case .failure(let error):
                self?.view?.showError(for: error.localizedDescription)
                self?.view?.loadingIndicator(isLoading: false)
            }
        })
    }
    
    func showDetailView(from nav: UINavigationController, withData data: FriendsInfo) {
        router?.showDetailViewController(from: nav, withData: data)
    }
}

struct URLPathConstant {
    static let baseURL = "https://randomuser.me"
    static let friendsUrl = baseURL + "/api/"
}
