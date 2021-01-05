//
//  ViewController.swift
//  Kieran's Egg Timer
//
//  Created by Kieran O'Donnell on 04/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var eggLabel: UILabel!
    
    //    Define time dict
    let eggTimes = ["Soft": (3), "Medium":(4), "Hard": (5)]
//    Initial value of counter
    var counter = 60
    
    var timer = Timer()
//    Removed viewDidLoad - no useful code for this method so safe to delete since any superclass that overrides it will still be called

    @IBAction func hardnessSelector(_ sender: UIButton) {
        
//        Invalidate time before starting
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
    
//    Needed to close IBAction part!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
        @objc func updateCounter() {
            if counter > 0 {
                print("\(counter) seconds to the end of the world")
                counter -= 1
            } else if (counter == 0){
                timer.invalidate()
                eggLabel.text = "Poof! Donezo!"
                }
        }
        
    }


