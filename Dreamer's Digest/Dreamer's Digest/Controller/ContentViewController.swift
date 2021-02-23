//
//  ContentViewController.swift
//  Dreamer's Digest
//
//  Created by Kieran O'Donnell on 24/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit
import CoreData

class ContentViewController: UIViewController {
    
    var dreamContentArray = [DreamContent]()
    var selectedDream : DreamCategory {
        didSet{
            // Load up modified items array
            //loadItems()
        }
    }
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
