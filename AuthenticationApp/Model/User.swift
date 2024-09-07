//
//  User.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 07/09/2024.
//

import Foundation

struct User {
    let name: String
    let email: String
    let gender: Gender
}

enum Gender: String {
    case female = "Female"
    case male = "Male"
}
