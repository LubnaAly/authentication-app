//
//  SignInVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var signInButtonTapped: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        goToProfile()
    }
}

private extension SignInVC {
    func setupUI() {
        title = "Sign In"
        setupLabels()
        setupTextFields()
        signInButtonTapped.setTitle("Sign In", for: .normal)
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
        
        guard emailTextField.text == user?.email else {
            showAlertMessage(title: "Alert", message: "Please enter a registered Email!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Password!")
            return false
        }
        
        guard enterPasswordTextField.text == user?.password else {
            showAlertMessage(title: "Alert", message: "Please enter the correct Password!")
            return false
        }
        
        return true
    }
    
    func goToProfile() {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC {
            profileVC.user = user
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}
