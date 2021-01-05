//
//  ViewController.swift
//  Kieran's Egg Timer
//
//  Created by Kieran O'Donnell on 04/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Define time dict
    let eggTimes = ["Soft": 4, "Medium":8, "Hard": 12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelector(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        switch hardness {
        case "Soft":
            print(eggTimes["Soft"]!)
        case "Medium":
            print(eggTimes["Medium"]!)
        case "Hard":
            print(eggTimes["Hard"]!)
        default:
            print("Time out of range")
        }
    }
    
}

