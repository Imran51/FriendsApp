//
//  friendsViewModel.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import UIKit

class FriendsViewModel: FriendsViewControllerToViewModel {
    
    var router: FriendsViewModelToRouter?
    
    var view: FriendsViewModelToViewController?
    
    func showDetailView(from nav: UINavigationController, withData data: FriendsInfo) {
        router?.showDetailViewController(from: nav, withData: data)
    }
    
    private let service: NetworkService = NetworkService.shared
    
    func fetchData() {
        view?.loadingIndicator(isLoading: true)
        let numberOfRequiredData = 20
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
}

struct URLPathConstant {
    static let baseURL = "https://randomuser.me"
    static let friendsUrl = baseURL + "/api/"
}
