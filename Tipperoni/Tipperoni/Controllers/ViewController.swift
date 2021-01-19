//
//  ViewController.swift
//  Tipperoni
//
//  Created by Kieran O'Donnell on 19/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Need to define last selected button to keep track of it...
    var lastSelectedButton = UIButton()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tenPctButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        lastSelectedButton.isSelected = false //Set last button to unselected
        lastSelectedButton = sender // Reset last button to be sender
        sender.isSelected = true // Set sender to be selected = true
        var tipRate = sender.currentTitle!
        tipRate = String(tipRate.dropLast())
        print(Float(tipRate)!/100)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//        splitNumberLabel = String(sender.value)
        let stepperValue = String(Int(sender.value))
        splitNumberLabel.text = stepperValue
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(splitNumberLabel.text ?? 2)
    }
    
}

