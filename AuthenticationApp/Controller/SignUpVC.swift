//
//  ViewController.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var UsergenderLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var signInButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func genderSwitchToggled(_ genderSwitch: UISwitch) {
        genderLabel.text = genderSwitch.isOn ? Gender.female.rawValue : Gender.male.rawValue
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        goToSignIn()
    }
}

private extension SignUpVC {
    func setupUI() {
        titleLabel.text = "Sign Up"
        nameLabel.text = "Name"
        nameTextField.placeholder = "Enter your name"
        emailLabel.text = "Email"
        emailTextField.placeholder = "Enter your email"
        enterPasswordLabel.text = "Enter Password"
        enterPasswordTextField.placeholder = "Enter your password"
        confirmPasswordLabel.text = "Confirm Password"
        confirmPasswordTextField.placeholder = "Confirm your password"
        UsergenderLabel.text = "Gender"
        signInButtonTapped.setTitle("Sign Up", for: .normal)
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
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    func showAlertMessage(title: String, message: String){
        let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertMessagePopUpBox.addAction(okButton)
        self.present(alertMessagePopUpBox, animated: true)
    }
    
    func goToSignIn() {
        if let signInVC = storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInVC {
            let user = User(
                name: nameTextField.text ?? "",
                email: emailTextField.text ?? "",
                password: enterPasswordTextField.text ?? "",
                gender: Gender(rawValue: genderLabel.text ?? "") ?? .female
            )
            signInVC.user = user
            navigationController?.pushViewController(signInVC, animated: true)
        }
    }
}


