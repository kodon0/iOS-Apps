//
//  ViewController.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 20/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    
//    Need to include UITextFieldDelegate protocol to register what happens in text field
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManager.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
        @IBAction func searchButtonPressed(_ sender: Any) {
            searchTextField.endEditing(true)
            print(searchTextField.text!)
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            
    //        This function registers what user inserted and submitted with keyboard return key
    //        searchTextField.endEditing(true) dismisses keyboard after typing andpressing return
            searchTextField.endEditing(true)
            print(searchTextField.text!)
            return true
        }
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    //        Good for validation and checking if text is not empty screen etc...
            if textField.text != "" {
                return true
            } else {
                textField.placeholder = "Type something..."
                return false
            }
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
    //        To be triggered after editing ended
    //        Use searchTextField.text for searching the weather. Then reset search to empty string.
            
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
            searchTextField.text = ""
        }
        
}
 // MARK: - WeatherManagerDelegate
extension WeatherViewController:WeatherManagerDelegate {
        func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
            
            print(weather.conditionName)
            print(weather.temperatureString)
            print(weather.humidityString)
            DispatchQueue.main.async { // Correct - async implementation on different thread - so user doesn't think app crashed
                self.tempLabel.text = weather.temperatureString
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            }
            
        }
        
        func didFailWithError(error: Error) {
    //        Print error to console
            print(error)
        }
    
}
