//
//  ResultsViewController.swift
//  Tipperoni
//
//  Created by Kieran O'Donnell on 19/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: String?
    var tip: Int?
    var numberOfPeople: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "Split between \(numberOfPeople!) people, with \(tip!)% tip."
    }


    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
