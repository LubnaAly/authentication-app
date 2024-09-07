//
//  SignInVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
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
        goToProfile()
    }
}

private extension SignInVC {
    func setupUI() {
        titleLabel.text = "Sign In"
        emailLabel.text = "Email"
        emailTextField.placeholder = "Enter your email"
        enterPasswordLabel.text = "Password"
        enterPasswordTextField.placeholder = "Enter your password"
        signInButtonTapped.setTitle("Sign In", for: .normal)
    }
    
    func goToProfile() {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC {
            profileVC.user = user
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
}
