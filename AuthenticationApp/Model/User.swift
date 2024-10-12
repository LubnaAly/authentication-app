//
//  User.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 07/09/2024.
//

import Foundation

struct User: Recordable {
    var id: Int?
    var name: String
    var profileImageData: Data?
    var email: String
    var password: String
    var gender: Gender
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
