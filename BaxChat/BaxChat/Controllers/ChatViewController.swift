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
    
    let db = Firestore.firestore()
    
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
        
//        Register custom tableview from MessageCell.xib (= nib)
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages(){
        db.collection(K.FStore.collectionName).addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let e = error {
                print("Error getting data from Firestore: \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                            if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
//                Send info to Firebase db
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data:[
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
                ]) {
                    (error) in if let e = error {
                        print("Issue savin gdata to Firestore. Error: \(e)")
                    } else {
                        print("Data saved to firestore")
                    }
            }
        }
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


//Table views work with delegation - UITableViewDataSource is for populating tableviews
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
}
