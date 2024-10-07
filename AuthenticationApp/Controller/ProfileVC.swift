//
//  ProfileVC.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class ProfileVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var logOutButton: UIButton!
    
    // MARK: - Properties
    private let uiModels: [ProfileCellUIModel] = [
        .init(title: "Name", value: UserDefaults.standard.string(forKey: "name") ?? ""),
        .init(title: "Email", value: UserDefaults.standard.string(forKey: "email") ?? ""),
        .init(title: "Gender", value: UserDefaults.standard.string(forKey: "gender") ?? ""),
    ]
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setProfileImage()
        tableView.dataSource = self
    }
    
    // MARK: - Actions
    @IBAction private func logOutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        goToLogin()
    }
}

// MARK: - Private Methods
extension ProfileVC {
    // MARK: - Setup UI
    func setupUI() {
        title = "Profile"
        logOutButton.setTitle("Log out", for: .normal)
    }
    
    // MARK: - Display User Data
    func setProfileImage() {
        guard let data = UserDefaults.standard.data(forKey: "profileImage") else { return }
        profileImageView.image = UIImage(data: data)
    }
    
    // MARK: - Navigation
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") {
            navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
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
