//
//  ViewController.swift
//  Kieran's Egg Timer
//
//  Created by Kieran O'Donnell on 04/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        print(sender.currentTitle!)
    }
    
}

