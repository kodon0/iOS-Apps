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
struct WeatherData: Decodable {
    let name:String
    let main: Main
    let weather: [Weather]
}
struct Main: Decodable{
    let temp:Double
    let humidity: Double
}
struct Weather: Decodable{
    let description: String
    let id: Int
}

