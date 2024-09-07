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
    
    func goToSignIn() {
        if let signInVC = storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInVC {
            let user = User(
                name: nameTextField.text ?? "",
                email: emailTextField.text ?? "",
                gender: genderLabel.text ?? ""
            )
            signInVC.user = user
            navigationController?.pushViewController(signInVC, animated: true)
        }
    }
}

enum Gender: String {
    case female = "Female"
    case male = "Male"
}

struct User {
    let name: String
    let email: String
    let gender: String
}
