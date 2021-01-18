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
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = BMIValue
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func recalcBMI(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
