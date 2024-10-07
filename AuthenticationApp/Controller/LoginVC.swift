//
//  LoginVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class LoginVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var enterPasswordLabel: UILabel!
    @IBOutlet private weak var enterPasswordTextField: UITextField!
    @IBOutlet private weak var loginButtonTapped: UIButton!
    @IBOutlet private weak var signUpHintLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    @IBAction private func loginButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        goToProfile()
        UserDefaultsManager.shared.setLoginStatus(true)
    }
    
    @IBAction private func signUpButtonTapped(_ sender: Any) {
        goToSignUp()
    }
}

// MARK: - Private Methods
private extension LoginVC {
    // MARK: - Setup UI
    func setupUI() {
        setupTitle()
        setupLabels()
        setupTextFields()
        setupButtons()
    }
    
    func setupTitle() {
        title = Constants.Texts.loginTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLabels() {
        emailLabel.text = Constants.Texts.email
        enterPasswordLabel.text = Constants.Texts.password
        signUpHintLabel.text = Constants.Texts.signUpHint
    }
    
    func setupTextFields() {
        emailTextField.placeholder = Constants.Placeholders.email
        enterPasswordTextField.placeholder = Constants.Placeholders.password
        enterPasswordTextField.isSecureTextEntry = true
    }
    
    func setupButtons() {
        loginButtonTapped.setTitle(Constants.ButtonsTitles.login, for: .normal)
        signUpButton.setTitle(Constants.ButtonsTitles.signUp, for: .normal)
    }
    
    // MARK: - Data Validation
    func isValidUserData() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyEmailMessage)
            return false
        }
        
        let userEmail = UserDefaultsManager.shared.getEmail()
        guard email == userEmail else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.registeredEmailMessage)
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyPasswordMessage)
            return false
        }
        
        let userPassword = UserDefaultsManager.shared.getPassword()
        guard password == userPassword else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.correctPasswordMessage)
            return false
        }
        
        return true
    }
    
    // MARK: - Navigation
    func goToProfile() {
        if let profileVC = storyboard?.instantiateViewController(identifier: Constants.Screens.profile) {
            navigationController?.setViewControllers([profileVC], animated: true)
        }
    }
    
    func goToSignUp() {
        if let signUpVC = storyboard?.instantiateViewController(identifier: Constants.Screens.signUp) {
            navigationController?.setViewControllers([signUpVC], animated: true)
        }
    }
}
