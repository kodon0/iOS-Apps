//
//  ViewController.swift
//  Todooshy
//
//  Created by Kieran O'Donnell on 16/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        print(dataFilePath)
        
        // Load up modified items array
        
//        let newItem = Item()
//        newItem.title = "Mlem Jessie!"
//        itemArray.append(newItem)
//
//        let newItem2 = Item()
//        newItem2.title = "Pooo!"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Peepee!"
//        itemArray.append(newItem3)

        loadItems()

//       if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
//        itemArray = items <- this is from UserDefaults! Kepeing for posterity
//     }
    }

    // MARK: - TableView DataScource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
//
        cell.accessoryType = item.done ? .checkmark: .none
        return cell
    }

    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row].title)
        print(!itemArray[indexPath.row].done)
        tableView.deselectRow(at: indexPath, animated: true)
        
//        Setting done status to be opposite of what it is currently
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//            Save items from defined method
        saveItems()
        
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
            
//            Save items from defined method
            self.saveItems()
        
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Start typing away!"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Save and load data methods
    
    func saveItems() {
        // Define encoding
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array: \(error)")
        }
        
        // Reloads the data with new items
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do {
             itemArray = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error decoding array: \(error)")
        }
        }
    }
}
