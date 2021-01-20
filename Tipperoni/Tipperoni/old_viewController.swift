//
//  old_viewController.swift
//  Tipperoni
//
//  Created by Kieran O'Donnell on 19/01/2021.
////  Copyright © 2021 baxmanduppa. All rights reserved.
////
//
//import Foundation
////
////  ViewController.swift
////  Tipperoni
////
////  Created by Kieran O'Donnell on 19/01/2021.
////  Copyright © 2021 baxmanduppa. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
////    Need to define last selected button to keep track of it...
//    var lastSelectedButton = UIButton()
//    var tip = 0.10
//    var numberOfPeople = 2
//    var billTotal = 0.0
//    var finalResult = "0.0"
//
//    @IBOutlet weak var billTextField: UITextField!
//    @IBOutlet weak var zeroPctButton: UIButton!
//    @IBOutlet weak var tenPctButton: UIButton!
//    @IBOutlet weak var twentyPctButton: UIButton!
//    @IBOutlet weak var splitNumberLabel: UILabel!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        tenPctButton.isSelected = false
//    }
//
//    @IBAction func tipChanged(_ sender: UIButton) {
//
//        lastSelectedButton.isSelected = false //Set last button to unselected
//        lastSelectedButton = sender // Reset last button to be sender
//        sender.isSelected = true // Set sender to be selected = true
//
//
//        let tipRateText = String(sender.currentTitle!.dropLast())
//        var tipRateNum = Double(tipRateText)!
//        tip = tipRateNum/100
//    }
//
//    @IBAction func stepperValueChanged(_ sender: UIStepper) {
//
//        splitNumberLabel.text = String(format: "%.0f", sender.value)
//        numberOfPeople = Int(sender.value)
//    }
//
//    @IBAction func calculatePressed(_ sender: UIButton) {
//
//
//        let bill = billTextField.text!
//        if bill != "" {
//            billTotal = Double(bill)!
//            let result = billTotal * (1 + tip) / Double(numberOfPeople)
//            finalResult = String(format: "%.2f", result)
//        }
//        self.performSegue(withIdentifier: "goToResults", sender: self)
//    }
//
//    //    Prepare for the segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToResults"{
//            let destinationVC = segue.destination as! ResultsViewController
//            destinationVC.result = finalResult
//            destinationVC.tip = Int(tip * 100)
//            destinationVC.numberOfPeople = numberOfPeople
//        }
//    }
//}

