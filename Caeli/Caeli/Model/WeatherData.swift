//
//  WeatherData.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 22/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

//Getting structure from API JSON -> decodable
//Need to get tree info for JSON keys
//Weather is an array...
//Define WeatherData data structure
struct WeatherData: Codable {
    let name:String
    let main: Main
    let weather: [Weather]
}
struct Main: Codable{
    let temp:Double
    let humidity: Double
}
struct Weather: Codable{
    let description: String
    let id: Int
}

