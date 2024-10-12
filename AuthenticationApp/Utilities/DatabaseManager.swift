//
//  DatabaseManager.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 10/10/2024.
//

import Foundation
import GRDB

typealias Recordable = Codable & FetchableRecord & PersistableRecord

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var dbQueue: DatabaseQueue?
    
    private init() {
        createDatabase()
        createTable()
    }
}

// MARK: - DataManaging
extension DatabaseManager: DataManaging {
    
    // MARK: - Setters
    func setName(_ name: String) {
        let user = User(name: name, email: "", password: "", gender: .female)
        save(user)
    }
    
    func setEmail(_ email: String) {
        guard var user = loadUser() else {
            print("❌", "User cannot be loaded!")
            return
        }
        user.email = email
        update(user)
    }
    
    func setPassword(_ password: String) {
        guard var user = loadUser() else {
            print("❌", "User cannot be loaded!")
            return
        }
        user.password = password
        update(user)
    }
    
    func setGender(_ gender: String) {
        guard var user = loadUser() else {
            print("❌", "User cannot be loaded!")
            return
        }
        user.gender = Gender(rawValue: gender) ?? .female
        update(user)
    }
    
    func setProfileImage(_ profileImageData: Data) {
        guard var user = loadUser() else {
            print("❌", "User cannot be loaded!")
            return
        }
        user.profileImageData = profileImageData
        update(user)
    }
    
    func setLoginStatus(_ isLoggedIn: Bool) {
        UserDefaultsManager.shared.setLoginStatus(isLoggedIn)
    }
    
    // MARK: - Getters
    
    func getName() -> String {
        loadUser()?.name ?? ""
    }
    
    func getEmail() -> String {
        loadUser()?.email ?? ""
    }
    
    func getPassword() -> String {
        loadUser()?.password ?? ""
    }
    
    func getGender() -> String {
        loadUser()?.gender.rawValue ?? ""
    }
    
    func getProfileImage() -> Data? {
        loadUser()?.profileImageData
    }
    
    func getLoginStatus() -> Bool {
        UserDefaultsManager.shared.getLoginStatus()
    }
}

// MARK: - Private Methods
private extension DatabaseManager {
    func createDatabase() {
        do {
            let documentDirectory = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first!
            let dbPath = documentDirectory.appendingPathComponent("AuthDB.sqlite").path
            dbQueue = try DatabaseQueue(path: dbPath)
            print("✅ DB Created at:", dbPath)
            
        } catch {
            print("❌", error)
        }
    }
    
    func createTable() {
        do {
            try dbQueue?.write { db in
                try db.create(table: "user", ifNotExists: true) { t in
                    t.primaryKey("id", .integer).primaryKey()
                    t.column("name", .text).notNull()
                    t.column("email", .text).notNull()
                    t.column("password", .text).notNull()
                    t.column("gender", .text).notNull()
                    t.column("profileImageData", .blob)
                }
            }
        } catch {
            print("❌", error)
        }
    }
    
    func save(_ user: User) {
        do {
            try dbQueue?.write { db in
                try user.insert(db)
            }
        } catch {
            print("❌", error)
        }
    }
    
    func update(_ user: User) {
        do {
            try dbQueue?.write { db in
                try user.update(db)
            }
        } catch {
            print("❌", error)
        }
    }
    
    func loadUser() -> User? {
        do {
            let users: [User]? = try dbQueue?.read { db in
                try User.fetchAll(db)
            }
            return users?.last
        } catch {
            print("❌", error)
        }
        return nil
    }
}
