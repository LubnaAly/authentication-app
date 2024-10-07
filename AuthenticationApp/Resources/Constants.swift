//
//  Constants.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 07/10/2024.
//

import Foundation

enum Constants {
    
    // MARK: - Storyboards
    enum Storyboards {
        static let main = "Main"
    }
    
    // MARK: - Screens
    enum Screens {
        static let signUp = "SignUpVC"
        static let login = "LoginVC"
        static let profile = "ProfileVC"
    }
    
    // MARK: - Texts
    enum Texts {
        static let signUpTitle = "Sign Up"
        static let loginTitle = "Login"
        static let profileTitle = "Profile"
        static let email = "Email"
        static let name = "Name"
        static let password = "Enter Password"
        static let passwordConfirmation = "Confirm Password"
        static let gender = "Gender"
        static let loginHint = "Already have an account?"
        static let signUpHint = "Don't have an account?"
    }
    
    // MARK: - Placeholders
    enum Placeholders {
        static let name = "Enter your name"
        static let email = "Enter your email"
        static let password = "Enter your password"
        static let passwordConfirmation = "Confirm your password"
    }
    
    // MARK: - ButtonsTitles
    enum ButtonsTitles {
        static let signUp = "Sign Up"
        static let login = "Login"
        static let logOut = "Log Out"
    }
    
    // MARK: - Alerts
    enum Alerts {
        static let title = "Alert"
        static let buttonTitle = "OK"
        static let emptyNameMessage = "Please enter your Name!"
        static let emptyEmailMessage = "Please enter your Email!"
        static let emptyPasswordMessage = "Please enter your Password!"
        static let emptyPasswordConfirmationMessage = "Please Confirm your password!"
        static let validEmailMessage = "Please enter a valid Email!"
        static let validPasswordMessage = "Please enter a correct Password!"
        static let registeredEmailMessage = "Please enter a registered Email!"
        static let correctPasswordMessage = "Please enter the correct Password!"
        static let samePasswordMessage = "Please enter the same Password"
    }
    
    // MARK: - Regex
    enum Regex {
        static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let password = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
    }
}
