//
//  CoinManager.swift
//  CrytpoTracker
//
//  Created by Kieran O'Donnell on 27/01/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, price: String, currency: String)
    func didFailWithError(error:Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "8B7CFA77-6363-4229-8A08-9D3CA5AEF6B0"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        self.performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String){

        if let url = URL(string: urlString){

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {

                    print(error!)
                    self.delegate?.didFailWithError(error: error!)

                    return
                }

                if let safeData = data{
                    let coinPrice = self.parseJSON(safeData)
                    let coinPriceString = String(format: "%.2f", coinPrice!)
                    self.delegate?.didUpdatePrice(price: coinPriceString, currency: currency)
                }
                
            }
            task.resume()
        }
    }
        func parseJSON(_ data: Data) -> Double? {
    //        Need to output data in JSON as a WeatherModel data type
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CoinData.self, from: data)
                let lastPrice = decodedData.rate
                print(lastPrice)
                return lastPrice
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
}
