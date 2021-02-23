//
//  ContentViewController.swift
//  Dreamer's Digest
//
//  Created by Kieran O'Donnell on 24/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var dreamContent = DreamContent()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
