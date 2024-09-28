//
//  SceneDelegate.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        setRootViewController()
    }
}

private extension SceneDelegate {
    func setRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var rootVC = UIViewController()
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            rootVC = storyboard.instantiateViewController(identifier: "ProfileVC")
        } else {
            rootVC = storyboard.instantiateViewController(identifier: "LoginVC")
        }
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
    }
}
