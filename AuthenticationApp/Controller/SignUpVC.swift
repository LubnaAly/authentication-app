//
//  ViewController.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignUpVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var enterPasswordLabel: UILabel!
    @IBOutlet private weak var enterPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordLabel: UILabel!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var userGenderLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var loginHintLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Properties
    private let dataManager: DataManaging = DatabaseManager.shared
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Actions
    @IBAction private func ImagePickerButtonTapped() {
        presentImagePicker()
    }
    
    @IBAction private func genderSwitchToggled(_ genderSwitch: UISwitch) {
        genderLabel.text = genderSwitch.isOn ? Gender.female.rawValue : Gender.male.rawValue
    }
    
    @IBAction private func signUpButtonTapped(_ sender: Any) {
        guard isValidUserData() else { return }
        saveUserData()
        goToLogin()
    }
    
    @IBAction private func loginButtonTapped(_ sender: Any) {
        goToLogin()
    }
}

// MARK: - Private Methods
private extension SignUpVC {
    // MARK: - Setup UI
    func setupUI() {
        setupTitle()
        setupLabels()
        setupTextFields()
        setupButtons()
    }
    
    func setupTitle() {
        title = Constants.Texts.signUpTitle
    }
    
    func setupLabels() {
        nameLabel.text = Constants.Texts.name
        emailLabel.text = Constants.Texts.email
        enterPasswordLabel.text = Constants.Texts.password
        confirmPasswordLabel.text = Constants.Texts.passwordConfirmation
        userGenderLabel.text = Constants.Texts.gender
        loginHintLabel.text = Constants.Texts.loginHint
    }
    
    func setupTextFields() {
        nameTextField.placeholder = Constants.Placeholders.name
        emailTextField.placeholder =  Constants.Placeholders.email
        enterPasswordTextField.placeholder = Constants.Placeholders.password
        confirmPasswordTextField.placeholder =  Constants.Placeholders.passwordConfirmation
        enterPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    func setupButtons() {
        signUpButton.setTitle(Constants.ButtonsTitles.signUp, for: .normal)
        loginButton.setTitle(Constants.ButtonsTitles.login, for: .normal)
    }
    
    // MARK: - Data Validation
    func isValidUserData() -> Bool {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyNameMessage)
            return false
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyEmailMessage)
            return false
        }
        
        guard let email = emailTextField.text, isValidEmail(email) else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.validEmailMessage)
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyPasswordMessage)
            return false
        }
        
        guard let password = enterPasswordTextField.text, isValidPassword(password) else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.validPasswordMessage)
            return false
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.emptyPasswordConfirmationMessage)
            return false
        }
        
        guard confirmPasswordTextField.text == enterPasswordTextField.text else {
            showAlertMessage(title: Constants.Alerts.title, message: Constants.Alerts.samePasswordMessage)
            return false
        }
        
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = Constants.Regex.email
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = Constants.Regex.password
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    // MARK: - Saving User Data
    func saveUserData() {
        dataManager.setName(nameTextField.text ?? "")
        dataManager.setEmail(emailTextField.text ?? "")
        dataManager.setPassword(enterPasswordTextField.text ?? "")
        dataManager.setGender(genderLabel.text ?? "")
        saveImage()
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func saveImage() {
        guard let data = profileImageView.image?.jpegData(compressionQuality: 0.5) else { return }
        dataManager.setProfileImage(data)
    }
    
    // MARK: - Navigation
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: Constants.Screens.login) {
            navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
        }
        dismiss(animated: true)
    }
}
