//
//  UIViewController+showAlert.swift
//  AuthenticationApp
//
//  Created by Lubna Ali on 09/09/2024.
//

import UIKit

extension UIViewController {
    func showAlertMessage(title: String, message: String){
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}
