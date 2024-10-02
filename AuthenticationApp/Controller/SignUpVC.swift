//
//  ViewController.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 03/09/2024.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var enterPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var userGenderLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var loginHintLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func ImagePickerButtonTapped() {
        presentImagePicker()
    }
    
    @IBAction func genderSwitchToggled(_ genderSwitch: UISwitch) {
        genderLabel.text = genderSwitch.isOn ? Gender.female.rawValue : Gender.male.rawValue
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
                guard isValidUserData() else { return }
        saveUserData()
        goToLogin()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        goToLogin()
    }
}

private extension SignUpVC {
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
    
    func goToLogin() {
        if let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC") {
            navigationController?.setViewControllers([loginVC], animated: true)
        }
    }
}

extension SignUpVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView.image = image
        }
        dismiss(animated: true)
    }
}
