//
//  SceneDelegate.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit
import IQKeyboardManagerSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let dataManager: DataManaging = UserDefaultsManager.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        setRootViewController()
        setupIQKeyboardManager()
    }
}

private extension SceneDelegate {
    func setRootViewController() {
        let storyboard = UIStoryboard(
            name: Constants.Storyboards.main,
            bundle: nil
        )
        var rootVC = UIViewController()
        if dataManager.getLoginStatus() {
            rootVC = storyboard.instantiateViewController(identifier: Constants.Screens.profile)
        } else {
            rootVC = storyboard.instantiateViewController(identifier: Constants.Screens.login)
        }
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
    }
    
    func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
}
