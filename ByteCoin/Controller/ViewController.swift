//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource {
    

    
    
    // MARK: - IBOutlets
    
    @IBOutlet var bitcoinPriceLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    @IBOutlet var currencyLabel: UILabel!
    
    // MARK: - Objects
    
    var coinManager = CoinManager()
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
    }
    
    
    // MARK: - UI Picker View Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
}

