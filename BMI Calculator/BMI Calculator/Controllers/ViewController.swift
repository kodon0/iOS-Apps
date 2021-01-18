//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightOut: UISlider!
    @IBOutlet weak var weightOut: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightValue.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValue.text = "\(weight)kg"
    }
    
    @IBAction func calcBMI(_ sender: UIButton) {
        let height = heightOut.value
        let weight = weightOut.value
        var BMI = weight/(pow(height, 2.0))
        print(BMI)
    }
}

