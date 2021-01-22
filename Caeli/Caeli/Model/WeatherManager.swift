//
//  WeatherManager.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 22/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=9040bc771694c9d8f29547ee0d1d5bcc&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
