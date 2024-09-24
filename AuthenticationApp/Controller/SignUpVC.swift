//
//  ViewController.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func genderSwitchToggled(_ genderSwitch: UISwitch) {
        genderLabel.text = genderSwitch.isOn ? Gender.female.rawValue : Gender.male.rawValue
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        saveUserData()
        goToLogin()
    }
}

private extension SignUpVC {
    func setupUI() {
        setupTitle()
        setupLabels()
        setupTextFields()
        loginButtonTapped.setTitle("Sign Up", for: .normal)
    }
    
    func setupTitle() {
        title = "Sign Up"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLabels() {
        nameLabel.text = "Name"
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Enter Password"
        confirmPasswordLabel.text = "Confirm Password"
        userGenderLabel.text = "Gender"
    }
    
    func setupTextFields() {
        nameTextField.placeholder = "Enter your name"
        enterPasswordTextField.placeholder = "Enter your password"
        emailTextField.placeholder = "Enter your email"
        confirmPasswordTextField.placeholder = "Confirm your password"
        enterPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    func isValidUserData() -> Bool {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Name!")
            return false
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Email!")
            return false
        }
        
        guard let email = emailTextField.text, isValidEmail(email) else {
            showAlertMessage(title: "Alert", message: "Please enter a valid Email!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Password!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, isValidPassword(password) else {
            showAlertMessage(title: "Alert", message: "Please enter a correct Password!")
            return false
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Confirm your password!")
            return false
        }
        
        guard confirmPasswordTextField.text == enterPasswordTextField.text else {
            showAlertMessage(title: "Alert", message: "Please enter the same Password")
            return false
        }
        
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func saveUserData() {
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        UserDefaults.standard.set(enterPasswordTextField.text, forKey: "password")
        UserDefaults.standard.set(genderLabel.text, forKey: "gender")
    }
    
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") {
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}
