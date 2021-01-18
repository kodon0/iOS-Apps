//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var BMIValue: String?
    var advice:String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = BMIValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    
    @IBAction func recalcBMI(_ sender: UIButton) {
        
//        Goes back to initial view controller
        self.dismiss(animated: true, completion: nil)
    }
    

}
