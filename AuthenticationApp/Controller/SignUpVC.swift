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
        title = "Sign Up"
    }
    
    func setupLabels() {
        nameLabel.text = "Name"
        emailLabel.text = "Email"
        enterPasswordLabel.text = "Enter Password"
        confirmPasswordLabel.text = "Confirm Password"
        userGenderLabel.text = "Gender"
        loginHintLabel.text = "Already have an account?"
    }
    
    func setupTextFields() {
        nameTextField.placeholder = "Enter your name"
        enterPasswordTextField.placeholder = "Enter your password"
        emailTextField.placeholder = "Enter your email"
        confirmPasswordTextField.placeholder = "Confirm your password"
        enterPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    func setupButtons() {
        signUpButton.setTitle("Sign Up", for: .normal)
        loginButton.setTitle("Login", for: .normal)
    }
    
    // MARK: - Data Validation
    func isValidUserData() -> Bool {
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Name!")
            return false
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Email!")
            return false
        }
        
        guard let email = emailTextField.text, isValidEmail(email) else {
            showAlertMessage(title: "Alert", message: "Please enter a valid Email!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, !password.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Password!")
            return false
        }
        
        guard let password = enterPasswordTextField.text, isValidPassword(password) else {
            showAlertMessage(title: "Alert", message: "Please enter a correct Password!")
            return false
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            showAlertMessage(title: "Alert", message: "Please enter your Confirm your password!")
            return false
        }
        
        guard confirmPasswordTextField.text == enterPasswordTextField.text else {
            showAlertMessage(title: "Alert", message: "Please enter the same Password")
            return false
        }
        
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    // MARK: - Saving User Data
    func saveUserData() {
        saveImage()
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        UserDefaults.standard.set(enterPasswordTextField.text, forKey: "password")
        UserDefaults.standard.set(genderLabel.text, forKey: "gender")
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func saveImage() {
        guard let data = profileImageView.image?.jpegData(compressionQuality: 0.5) else { return }
        UserDefaults.standard.set(data, forKey: "profileImage")
    }
    
    // MARK: - Navigation
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") {
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
