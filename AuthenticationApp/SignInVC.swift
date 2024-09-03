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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Sign In"
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Password"
        signInButtonTapped.setTitle("Sign In", for: .normal)
    }

    @IBAction func signInButtonTapped(_ sender: Any) {
        if let profileVC = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC {
            navigationController?.pushViewController(profileVC, animated: true)
        }

    }
    
}
