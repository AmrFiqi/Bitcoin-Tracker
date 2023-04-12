//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Amr El-Fiqi on 12/04/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    var price: Double
    
    var priceString: String {
        String(format: "%.2f", price)
    }
}
