//
//  friendsViewModel.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import Foundation

class FriendsViewModel {
    private let service: NetworkService = NetworkService.shared
    weak var delegate: FriendsViewModelProtocol?
    
    func fetchData() {
        let numberOfRequiredData = 10
        let urlParameter = "?results=\(numberOfRequiredData)"
        guard let url = URL(string: URLPathConstant.friendsUrl+urlParameter) else {
            delegate?.showError(for: "URL can be not constructed properly.")
            return
        }
        
        service.fetchData(for: url, completion: {[weak self] (result: Result<FriendsModel,Error>) in
            switch result {
            case .success(let model):
                self?.delegate?.updateView(for: model.results)
            case .failure(let error):
                self?.delegate?.showError(for: error.localizedDescription)
            }
        })
    }
}

struct URLPathConstant {
    static let baseURL = "https://randomuser.me"
    static let friendsUrl = baseURL + "/api/"
}
