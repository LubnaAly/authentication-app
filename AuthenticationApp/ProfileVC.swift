//
//  ProfileVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var UserEmailLabel: UILabel!
    @IBOutlet weak var UserGenderLabel: UILabel!

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUserData()
    }
}

extension ProfileVC {
    func setupUI() {
        titleLabel.text = "Profile"
        UserNameLabel.text = "Name"
        UserEmailLabel.text = "Email"
        UserGenderLabel.text = "Gender"
    }
    
    func setUserData() {
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        genderLabel.text = user?.gender
    }
}
