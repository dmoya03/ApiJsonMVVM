//
//  Model2.swift
//  JSON
//
//  Created by Daniel Moya on 12/1/24.
//

import Foundation

struct Model2: Decodable {
    var data: [UserList]
}

struct User: Decodable {
    var data: UserList
}

struct UserList: Decodable {
    var id: Int
    var first_name: String
    var email: String
    var avatar: String
}
