//
//  ViewController.swift
//  CrytpoTracker
//
//  Created by Kieran O'Donnell on 27/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    let coinManager = CoinManager()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Only want 1 column in picker
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count // Number of rows from currencies insinde array
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManager.currencyArray[row])
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate =  self
    }


}

//extension ViewController: CoinManagerDelegate {

//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//
//    func didUpdatePrice(price:String, currency: String){
//        DispatchQueue.main.async { // Correct - async implementation on different thread - so user doesn't think app crashed
//            self.bitCoinLabel.text = price
//            self.bitCoinLabel.text = currency
//        }
//
//    }
//}
