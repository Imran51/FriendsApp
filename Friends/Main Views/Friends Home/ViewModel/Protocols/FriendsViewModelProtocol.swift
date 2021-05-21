//
//  FriendsViewModelProtocol.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import Foundation

protocol FriendsViewModelProtocol: AnyObject {
    func updateView(for data: [FriendsInfo])
    func showError(for error: String)
}


