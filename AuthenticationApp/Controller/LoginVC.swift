//
//  LoginVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class LoginVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!
    @IBOutlet weak var signUpHintLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        goToProfile()
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        goToSignUp()
    }
}

// MARK: - Extensions
private extension LoginVC {
    // MARK: - Setup UI methods
    func setupUI() {
        setupTitle()
        setupLabels()
        setupTextFields()
        setupButtons()
    }
    
    func setupTitle() {
        title = "Login"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLabels() {
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Password"
        signUpHintLabel.text = "Don't have an account?"
    }
    
    func setupTextFields() {
        emailTextField.placeholder = "Enter your email"
        enterPasswordTextField.placeholder = "Enter your password"
        enterPasswordTextField.isSecureTextEntry = true
    }
    
    func setupButtons() {
        loginButtonTapped.setTitle("Login", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
    }
    // MARK: - Data validation methods
    func isValidUserData() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Email!")
            return false
        }
        
        let userEmail = UserDefaults.standard.string(forKey: "email")
        guard email == userEmail else {
            showAlertMessage(title: "Alert", message: "Please enter a registered Email!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Password!")
            return false
        }
        
        let userPassword = UserDefaults.standard.string(forKey: "password")
        guard password == userPassword else {
            showAlertMessage(title: "Alert", message: "Please enter the correct Password!")
            return false
        }
        
        return true
    }
    // MARK: - Navigate to the next ViewController
    func goToProfile() {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") {
            navigationController?.setViewControllers([profileVC], animated: true)
        }
    }
    // MARK: - Navigate to the previous ViewController
    func goToSignUp() {
        if let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpVC") {
            navigationController?.setViewControllers([signUpVC], animated: true)
        }
    }
}
