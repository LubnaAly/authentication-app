//
//  ProfileVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var UserEmailLabel: UILabel!
    @IBOutlet weak var UserGenderLabel: UILabel!
    @IBOutlet weak var logOutButtonTapped: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUserData()
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        goToSignUp()
    }
}

extension ProfileVC {
    func setupUI() {
        title = "Profile"
        UserNameLabel.text = "Name"
        UserEmailLabel.text = "Email"
        UserGenderLabel.text = "Gender"
        logOutButtonTapped.setTitle("Log out", for: .normal)
    }
    
    func setUserData() {
        nameLabel.text = UserDefaults.standard.string(forKey: "name")
        emailLabel.text = UserDefaults.standard.string(forKey: "email")
        genderLabel.text = UserDefaults.standard.string(forKey: "gender")
    }
    
    func goToSignUp() {
        if let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpVC") {
            navigationController?.setViewControllers([signUpVC], animated: true)
        }
    }
}
