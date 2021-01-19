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
        
        lastSelectedButton.isSelected = false //Plus any deselect logic for this button
        lastSelectedButton = sender //If any buttons are not affect by this selection logic exclude them here
        sender.isSelected = true
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
}

//zeroPctButton.isSelected = true
//tenPctButton.isSelected = false
//twentyPctButton.isSelected = false
