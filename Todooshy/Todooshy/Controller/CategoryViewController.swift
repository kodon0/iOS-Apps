//
//  CategoryViewController.swift
//  Todooshy
//
//  Created by Kieran O'Donnell on 18/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [ItemCategory]()

    // This gets Context from AppDelegate class
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()


    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
    
        return cell
    }
    
    //MARK: - Define TableView Delegate Methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Define Data Manipulation Methods
    
     func saveItems() {
         
         do {
             try context.save()
         } catch {
             print("Error saving Context: \(error)")
         }
         self.tableView.reloadData()
     }
     
     func loadItems(with request: NSFetchRequest<ItemCategory> = ItemCategory.fetchRequest()) {
         do {
             categoryArray = try context.fetch(request)
         } catch {
             print("Error fetching data from context: \(error)")
         }
    }
    
    //MARK: - Add new categories


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Insert a new list category?", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add new category", style: .default) { (action) in
            print("Action success!")
            
            // Append new category to array with new addition for CoreData -> gets context
            
            let newCategory = ItemCategory(context: self.context)
            newCategory.name = textField.text!
            self.categoryArray.append(newCategory)
            self.saveItems()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Start typing away!"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
        
    }
    

}
