//
//  FriendsModel.swift
//  Friends
//
//  Created by Imran Sayeed on 21/5/21.
//

import Foundation

struct FriendsModel: Codable {
    let results:[FriendsInfo]
}

struct FriendsInfo: Codable {
    let gender: String
    let name: NameInfo
    let location: Address
    let picture: PictureInfo
}

struct PictureInfo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct NameInfo: Codable {
    let title: String
    let first: String
    let last: String
}

struct Address: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
}

struct Street: Codable {
    let number: Int
    let name: String
}
