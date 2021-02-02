//
//  WelcomeViewController.swift
//  BaxChat
//
//  Created by Kieran O'Donnell on 02/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Animated text with incremental delivery using timer
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "BaxChat"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
       
    }
    

}

