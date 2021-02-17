//
//  ViewController.swift
//  Todooshy
//
//  Created by Kieran O'Donnell on 16/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    
    var itemArray = [Item]()

    
    // This gets Context from AppDelegate class
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        print to show directory of SQLite database
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        // Load up modified items array
        
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
            
            // Append new item to array with new addition for CoreData -> gets context
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
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
        
        // Get context.save method from AppDelegate.saveContext()
        do {
            try context.save()
        } catch {
            print("Error saving Context: \(error)")
        }
        
        // Reloads the data with new items
        self.tableView.reloadData()
    }
    
    func loadItems() {
        // Must specifiy data type as there is a lot of logic involved
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
   }
}
