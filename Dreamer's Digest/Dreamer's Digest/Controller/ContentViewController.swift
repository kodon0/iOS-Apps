//
//  ContentViewController.swift
//  Dreamer's Digest
//
//  Created by Kieran O'Donnell on 24/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CoreData

class ContentViewController: UIViewController,  UITextViewDelegate {
    
    var dreamContentArray = [DreamContent]()
    var selectedDream : DreamCategory? {
        didSet{
            // Load up modified items array
            loadItems()
        }
    }
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    @IBOutlet weak var itemEntryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    @IBAction func saveItem(_ sender: UIBarButtonItem) {
    
        guard let enteredText = itemEntryTextView?.text else {
                 return
             }
         
             if enteredText.isEmpty ||  itemEntryTextView?.text == "Type anything..."{
        
             let alert = UIAlertController(title: "Please Type Something", message: "Your entry was left blank.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Okay", style: .default) { action in

             })

             self.present(alert, animated: true, completion: nil)

         } else {
             
                 guard let entryText = itemEntryTextView?.text else {
                     return
                 }
            
//                 let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                 let newEntry = DreamContent(context: context)
                 newEntry.dreamContent = entryText
                newEntry.parentCategory = self.selectedDream
                 
//                 (UIApplication.shared.delegate as! AppDelegate).saveContext()
//                print("saved \(newEntry)")
                 
                 dismiss(animated: true, completion: nil)
                        do {
                    try context.save()
                            print("saved \(newEntry)")
                } catch {
                    print("Error saving Context: \(error)")
                }
                
        dismiss(animated: true, completion: nil)
        
    }
    }
    
//     func loadItems(with request: NSFetchRequest<DreamContent> = DreamContent.fetchRequest(), predicate: NSPredicate? = nil) {
//
//
//        let categoryPredicate = NSPredicate(format: "parentCategory.name CONTAINS[cd] %@", selectedDream!.name!)
//
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//
//         do {
//             dreamContentArray = try context.fetch(request)
//         } catch {
//             print("Error fetching data from context: \(error)")
//         }
//    }
//
    
    func loadItems(with request: NSFetchRequest<DreamContent> = DreamContent.fetchRequest(), predicate: NSPredicate? = nil) {
        
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES[cd] %@", selectedDream!.name!)

         do {
             dreamContentArray = try context.fetch(request)
            print("loaded \(dreamContentArray)")
            itemEntryTextView?.text = "woong"
         } catch {
             print("Error fetching data from context: \(error)")
         }
    }
    
}
