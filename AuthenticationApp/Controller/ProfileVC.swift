//
//  ProfileVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!
    
    private let uiModels: [ProfileCellUIModel] = [
        .init(title: "Name", value: UserDefaults.standard.string(forKey: "name") ?? ""),
        .init(title: "Email", value: UserDefaults.standard.string(forKey: "email") ?? ""),
        .init(title: "Gender", value: UserDefaults.standard.string(forKey: "gender") ?? ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setProfileImage()
        tableView.dataSource = self
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        goToLogin()
    }
}

extension ProfileVC {
    func setupUI() {
        title = "Profile"
        logOutButton.setTitle("Log out", for: .normal)
    }
    
    func setProfileImage() {
        guard let data = UserDefaults.standard.data(forKey: "profileImage") else { return }
        profileImageView.image = UIImage(data: data)
    }
    
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") {
            navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
}

extension ProfileVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uiModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.backgroundColor = .tertiarySystemGroupedBackground
        cell.textLabel?.text = uiModels[indexPath.row].title
        cell.detailTextLabel?.text = uiModels[indexPath.row].value
        return cell
    }
}
