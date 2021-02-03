//
//  LoginViewController.swift
//  BaxChat
//
//  Created by Kieran O'Donnell on 02/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
//    Define the show alert function
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                //                switch statement to flip between different error codes https://firebase.google.com/docs/reference/swift/firebaseauth/api/reference/Enums/AuthErrorCode#/c:@E@FIRAuthErrorCode@FIRAuthErrorCodeInvalidCustomToken
                    switch errCode {
                        case .invalidEmail:
                            print("Invalid email")
                            self.showAlert(message: "Invalid email")
                        case .emailAlreadyInUse:
                            print("Email in use")
                            self.showAlert(message: "Email in use")
                        case .operationNotAllowed:
                            print("Operation not allowed")
                            self.showAlert(message: "Operation not allowed")
                        case .invalidCustomToken:
                            print("Invalid token")
                            self.showAlert(message: "Invalid token")
                        case .wrongPassword:
                            print("Incorrect password")
                            self.showAlert(message: "Incorrect password")
                        case .userDisabled:
                             print("User banned")
                             self.showAlert(message: "User banned")
                        case .userNotFound:
                            print("User doesn't exist")
                            self.showAlert(message: "User doesn't exist")
                        default:
                            print("Create User Error: \(error!)")
                    }
                }
            } else {
                self.performSegue(withIdentifier: "LoginToChat", sender: self)
                
            }

            }
        }
    }
}
