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


    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUserData()
    }
        
    @IBAction func logOutButtonTapped(_ sender: Any) {
        if let signUpVC = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC {
            navigationController?.popToRootViewController(animated: true)
        }
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
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        genderLabel.text = user?.gender.rawValue
    }
}
