//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var BMIValue = "0.0"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
//        Defining user made label
        let label = UILabel()
        label.text = BMIValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label) //Inherited form UIView...
    }
}
