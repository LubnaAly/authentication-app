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
    
    // MARK: - Setters
    func setName(_ name: String) {
        UserDefaults.standard.set(name, forKey: "name")
    }
    
    func setEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: "email")
    }
    
    func setPassword(_ password: String) {
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    func setGender(_ gender: String) {
        UserDefaults.standard.set(gender, forKey: "gender")
    }
    
    func setProfileImage(_ profileImageData: Data) {
        UserDefaults.standard.set(profileImageData, forKey: "profileImage")
    }
    
    func setIsLoggedIn(_ isLoggedIn: Bool ) {
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
   
    
    // MARK: - Getters
    func getName() -> String {
        UserDefaults.standard.string(forKey: "name") ?? ""
    }
    
    func getEmail() -> String {
        UserDefaults.standard.string(forKey: "email") ?? ""
    }
    
    func getPassword() -> String {
        UserDefaults.standard.string(forKey: "password") ?? ""
    }
    
    func getGender() -> String {
        UserDefaults.standard.string(forKey: "gender") ?? ""
    }
        
    func getProfileImage() -> Data? {
        UserDefaults.standard.data(forKey: "profileImage")
    }
    
    func getLoginStatus() -> Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
