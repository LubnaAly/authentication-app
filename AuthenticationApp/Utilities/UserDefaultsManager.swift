//
//  UserDefaultsManager.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 07/10/2024.
//

import Foundation

class UserDefaultsManager {
    // MARK: - Singleton
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    // MARK: - UserDefaultsKeys
    private enum UserDefaultsKeys: String {
        case name
        case email
        case password
        case gender
        case profileImage
        case isLoggedIn
    }
}

extension UserDefaultsManager: DataManaging {
    // MARK: - Setters
    func setName(_ name: String) {
        UserDefaults.standard.set(name, forKey: UserDefaultsKeys.name.rawValue)
    }
    
    func setEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: UserDefaultsKeys.email.rawValue)
    }
    
    func setPassword(_ password: String) {
        UserDefaults.standard.set(password, forKey: UserDefaultsKeys.password.rawValue)
    }
    
    func setGender(_ gender: String) {
        UserDefaults.standard.set(gender, forKey: UserDefaultsKeys.gender.rawValue)
    }
    
    func setProfileImage(_ profileImageData: Data) {
        UserDefaults.standard.set(profileImageData, forKey: UserDefaultsKeys.profileImage.rawValue)
    }
    
    func setLoginStatus(_ isLoggedIn: Bool ) {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    // MARK: - Getters
    func getName() -> String {
        UserDefaults.standard.string(forKey: UserDefaultsKeys.name.rawValue) ?? ""
    }
    
    func getEmail() -> String {
        UserDefaults.standard.string(forKey: UserDefaultsKeys.email.rawValue) ?? ""
    }
    
    func getPassword() -> String {
        UserDefaults.standard.string(forKey: UserDefaultsKeys.password.rawValue) ?? ""
    }
    
    func getGender() -> String {
        UserDefaults.standard.string(forKey: UserDefaultsKeys.gender.rawValue) ?? ""
    }
    
    func getProfileImage() -> Data? {
        UserDefaults.standard.data(forKey: UserDefaultsKeys.profileImage.rawValue)
    }
    
    func getLoginStatus() -> Bool {
        UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
