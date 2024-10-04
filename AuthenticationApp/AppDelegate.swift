//
//  AppDelegate.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit
import IQKeyboardManagerSwift


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        return true
    }
}
