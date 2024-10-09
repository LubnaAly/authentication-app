//
//  DataManaging.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 08/10/2024.
//

import Foundation

protocol DataManaging {
    func setName(_ name: String)
    func setEmail(_ email: String)
    func setPassword(_ password: String)
    func setGender(_ gender: String)
    func setProfileImage(_ profileImageData: Data)
    func setLoginStatus(_ isLoggedIn: Bool)
    
    func getName() -> String
    func getEmail() -> String
    func getPassword() -> String
    func getGender() -> String
    func getProfileImage() -> Data?
    func getLoginStatus() -> Bool
}
