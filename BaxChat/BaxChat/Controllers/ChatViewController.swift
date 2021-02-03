//
//  ChatViewController.swift
//  BaxChat
//
//  Created by Kieran O'Donnell on 02/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "4@6.com", body: "Ya Hozna"),
        Message(sender: "1@2.com", body: "Does Humor Belong in Music?"),
        Message(sender: "4@6.com", body: "I'm the Wonderful Wino!"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        tableView.dataSource = self //Trigger delegate methods from ChatVC
        navigationItem.hidesBackButton = true //Hides back button

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {

        do {
          try Auth.auth().signOut()
//            Use popToRoot to go back to homescreen
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}


//Table views work with delegation
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "This cell!"
        return cell
    }
    
    
}
