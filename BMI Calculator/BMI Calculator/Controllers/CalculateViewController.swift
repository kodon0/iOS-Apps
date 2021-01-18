//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Kieran O'Donnell on 18/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorLogic = CalculatorLogic()
    var BMIValue = "0.0"
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
        calculatorLogic.calculateBMI(height:height, weight:weight)
//        Second view controller with segue
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
//    Prepare for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destiationVC = segue.destination as! ResultViewController
            destiationVC.BMIValue = calculatorLogic.getBMIValue()
            destiationVC.advice = calculatorLogic.getAdvice()
            destiationVC.color = calculatorLogic.getColor()
        }
    }
}

