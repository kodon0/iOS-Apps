//
//  RegisterViewController.swift
//  BaxChat
//
//  Created by Kieran O'Donnell on 02/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
//        Show an alert pop-up defined in showAlert function
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
                self.showAlert(message: e.localizedDescription)
                
                } else {
                    // If no error, go to chat view controller via segue inside enclosure
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
}


