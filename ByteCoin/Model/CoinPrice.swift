//
//  CoinPrice.swift
//  ByteCoin
//
//  Created by Amr El-Fiqi on 12/04/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinPrice {
    var exchangeRate: String
 
    enum CodingKeys: String, CodingKey {
        case exchangeRate = "rate"
    }
}
