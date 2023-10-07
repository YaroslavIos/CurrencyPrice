//
//  CurrencyDetailsViewModel.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import Foundation
import SwiftUI

class CurrencyDetailsViewModel: ObservableObject {
    var currencyName: String {
        currency.name
    }
    
    var image: Data {
        var image = Data()
        
        do {
            image = try NetworkManager.shared.fetchImage(from: currency.image)
        } catch {
            print(error)
        }
        
        return image
    }
    
    var symbol: String {
        "\(currency.symbol)"
    }
    
    var currentPrice: Double {
        currency.current_price
    }
    
    var rank: Int {
        currency.market_cap_rank
    }
    
    var priceChanged: Double {
        currency.price_change_24h
    }
    
    var priceChangedPercentage: Double {
        currency.price_change_percentage_24h
    }
    
    var highPrice: Double {
        currency.high_24h
    }
    
    var lowPrice: Double {
        currency.low_24h
    }
    
    var lastUpdate: String {
        "\(currency.last_updated)"
    }
    
    private let currency: Currency
    
    init(currency: Currency) {
        self.currency = currency
    }
}
