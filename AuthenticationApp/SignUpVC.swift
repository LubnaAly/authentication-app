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
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var signInButtonTapped: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Sign Up"
        nameLabel.text = "Name"
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Enter Password"
        confirmPasswordLabel.text = "Confirm Password"
        signInButtonTapped.setTitle("Sign Up", for: .normal)

        
    }
    
    @IBAction func genderSwitchToggled(_ sender: Any) {
        print(#function)
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        if let signInVC = storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInVC {
            navigationController?.pushViewController(signInVC, animated: true)
        }
    }
}

