//
//  Currency.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 8.9.2023.
//

import Foundation

struct Currency: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap_rank: Int
    let price_change_24h: Double
    let price_change_percentage_24h: Double
    let high_24h: Double
    let low_24h: Double
    let last_updated: String
}
