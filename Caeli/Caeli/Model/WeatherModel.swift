//
//  WeatherModel.swift
//  Caeli
//
//  Created by Kieran O'Donnell on 22/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let humidity: Double
    
    var temperatureString:String {
        String(format: "%.1f", temperature)
    }
    
    var humidityString:String {
        String(format: "%.1f", humidity)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...299:
            return "cloud.bolt.rain"
        case 300...399:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.heavyrain"
        case 600...699:
            return "cloud.snow"
        case 700...799:
            return "cloud.fog"
        case 801...899:
            return "cloud.bolt"
        case 800:
            return "sun.max"
        default:
            return "cloud"
    }
    }
}
