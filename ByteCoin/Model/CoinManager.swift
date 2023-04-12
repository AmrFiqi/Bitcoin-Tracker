//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ""
    
    var delegate: CoinManagerDelegate?
    var coinPrice: CoinPrice?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let urlSession = URLSession(configuration: .default)
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let data = data {
                    if let price = parseJSON(data){
                        delegate?.didUpdatePrice(self, coin: price)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ priceData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinPrice.self, from: priceData)
            let rate = decodedData.exchangeRate
            let coinModel = CoinModel(price: rate)
            return coinModel
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


