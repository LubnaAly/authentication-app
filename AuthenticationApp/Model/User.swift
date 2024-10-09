//
//  User.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 07/09/2024.
//

import Foundation

struct User: Codable {
    var name: String
    var profileImage: Data?
    var email: String
    var password: String
    var gender: Gender
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
