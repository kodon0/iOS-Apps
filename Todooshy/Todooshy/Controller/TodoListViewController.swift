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
    var selectedCategory : ItemCategory? {
        didSet{
            // Load up modified items array
            loadItems()

        }
    }

    
    // This gets Context from AppDelegate class
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        print to show directory of SQLite database
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

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
        
        cell.accessoryType = item.done ? .checkmark: .none
        return cell
    }

    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row].title)
        print(!itemArray[indexPath.row].done)

//        Note ordering - must delete from context first! Below will delete data from app and db
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
//        Setting done status to be opposite of what it is currently
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
//            Save items from defined method (i.e. Update and commit)
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
            newItem.parentCategory = self.selectedCategory
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
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
        // Must specifiy data type as there is a lot of logic involved.
        // Added default value (Item.fetchRequest) and required input as this is reused
        // let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES[cd] %@", selectedCategory!.name!)
//        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, predicate])
        
        
        if let additionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
   }
    
}
    //MARK: - Extensions -Search bar

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Defines delegate methods for search bar
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        // Querying data bases:
        // This can be found in NSPredicate cheat sheet -> syntax is like regex x SQL
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        // Define a sorting descriptor -> for ascending alphabetical order for title
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        // Above can be refactored - but keeping due to clarity...
        
        loadItems(with: request, predicate: predicate)
        
//        Removed following in lieu of loadItems(with: request) do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Could not complete search: \(error)")
//        }
//
        tableView.reloadData()
    }
        
        func searchBar(_ searchBar:UISearchBar, textDidChange searchText:String){
            if searchBar.text?.count == 0 {
                loadItems()
                
                //Dismiss keyboard! Use dispatch queue to change threads
                DispatchQueue.main.async {
                    searchBar.resignFirstResponder()
                }
            tableView.reloadData()
                
            }
        }
}
