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
    
    private var user = User(name: "", email: "", password: "", gender: .male)
    
    private init() {}
    
    // MARK: - UserDefaultsKeys
    private enum UserDefaultsKeys: String {
        case user
        case isLoggedIn
    }
}

// MARK: - DataManaging
extension UserDefaultsManager: DataManaging {
    // MARK: - Setters
    func setName(_ name: String) {
        user.name = name        
        saveUser()
    }
    
    func setEmail(_ email: String) {
        user.email = email
        saveUser()
    }
    
    func setPassword(_ password: String) {
        user.password = password
        saveUser()
    }
    
    func setGender(_ gender: String) {
        user.gender = Gender(rawValue: gender) ?? .female
        saveUser()
    }
    
    func setProfileImage(_ profileImageData: Data) {
        user.profileImage = profileImageData
        saveUser()
    }
    
    func setLoginStatus(_ isLoggedIn: Bool ) {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    // MARK: - Getters
        
    func getName() -> String {
        loadUser()
        return user.name
    }
    
    func getEmail() -> String {
        loadUser()
        return user.email
    }
    
    func getPassword() -> String {
        loadUser()
        return user.password
    }
    
    func getGender() -> String {
        loadUser()
        return user.gender.rawValue
    }
    
    func getProfileImage() -> Data? {
        loadUser()
        return user.profileImage
    }
    
    func getLoginStatus() -> Bool {
        UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}

// MARK: - Private Methods
private extension UserDefaultsManager {
    func saveUser() {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.user.rawValue)
        }
    }
    
    func loadUser() {
        if let data = UserDefaults.standard.object(forKey: UserDefaultsKeys.user.rawValue) as? Data,
           let user = try? JSONDecoder().decode(User.self, from: data) {
            self.user = user
        }
    }
}
