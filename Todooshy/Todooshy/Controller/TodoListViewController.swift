//
//  ViewController.swift
//  Todooshy
//
//  Created by Kieran O'Donnell on 16/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Load up modified items array
        
        let newItem = Item()
        newItem.title = "Mlem Jessie!"
        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Pooo!"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Peepee!"
        itemArray.append(newItem3)
        
        
//
//        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
//
//        }
    }

    // MARK: - TableView DataScource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellFor Row at index path called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row].title)
        print(itemArray[indexPath.row].done)
        tableView.deselectRow(at: indexPath, animated: true)
        
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        }
        
        tableView.reloadData()
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add new list items - with pop-up alert!
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Insert a new Todooshy item?", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add new item", style: .default) { (action) in
            // What heppens when user clicks Add Item button
            print("Action success!")
            
            // Append new item to array
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            // Save new item using UserDefaults
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            // Reloads the data with new items
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Start typing away!"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
}
