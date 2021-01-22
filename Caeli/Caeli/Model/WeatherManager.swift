//
//  WeatherManager.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 22/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=9040bc771694c9d8f29547ee0d1d5bcc&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        //        Check if string is nil
        print(URL(string: urlString) ?? "Nil URL")
        print("*\(urlString)*")
        //        1) Create URL
        if let url = URL(string: urlString){
            //        2) Create URL session
            let session = URLSession(configuration: .default)
            //        3) Give session a tesk
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    //            If there is an error, print it in debug console
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(weatherData: safeData)
                }
            }
            //        4) Start task
            task.resume()
        }
    }
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let hum = decodedData.main.humidity
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, humidity: hum)
            print(weather.conditionName)
            print(weather.temperatureString)
//            print(decodedData.weather[0].description)
//            print(decodedData.weather[0].id)
//            print(decodedData.main.humidity)
//            print(decodedData.main.temp)
        } catch{
            print(error)
        }
    }
    

}
