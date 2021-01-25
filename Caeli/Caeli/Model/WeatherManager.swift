//
//  WeatherManager.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 22/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

//Define protocol to make a delegate design pattern
protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=9040bc771694c9d8f29547ee0d1d5bcc&units=metric"
    
    var delegate: WeatherManagerDelegate?
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
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            //        4) Start task
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel? {
//        Need to output data in JSON as a WeatherModel data type
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let hum = decodedData.main.humidity
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, humidity: hum)
//            print(weather.conditionName)
//            print(weather.temperatureString)
//            print(weather.humidityString)
//            print(decodedData.weather[0].description)
//            print(decodedData.weather[0].id)
//            print(decodedData.main.humidity)
//            print(decodedData.main.temp)
            return weather
        } catch{
            print(error)
            return nil
        }
    }
    

}
