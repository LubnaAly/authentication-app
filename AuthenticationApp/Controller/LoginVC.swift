//
//  LoginVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        goToProfile()
    }
}

private extension LoginVC {
    func setupUI() {
        title = "Login"
        setupLabels()
        setupTextFields()
        loginButtonTapped.setTitle("Login", for: .normal)
    }
    
    func setupLabels() {
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Password"
    }
    
    func setupTextFields() {
        emailTextField.placeholder = "Enter your email"
        enterPasswordTextField.placeholder = "Enter your password"
        enterPasswordTextField.isSecureTextEntry = true
    }
    
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
    
    func goToProfile() {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") {
            navigationController?.setViewControllers([profileVC], animated: true)
        }
    }
}
