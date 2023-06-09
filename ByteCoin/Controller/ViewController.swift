//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var bitcoinPriceLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    @IBOutlet var currencyLabel: UILabel!
    
    // MARK: - Objects
    
    var coinManager = CoinManager()
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

// MARK: - UI Picker View Data Source Methods

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

// MARK: - UI Picker View Delegate

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
        self.currencyLabel.text = self.coinManager.currencyArray[row]
    }
}

// MARK: - Coin Manager Delegate

extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinPriceLabel.text = coin.priceString
        }
    }
    func didFailWithError(error: Error) {
        print(String(describing: error))
    }
}

