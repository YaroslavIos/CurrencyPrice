//
//  NetworkManager.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import Foundation

enum NetworkError: Error {
case noData
case invalidURL
case DecodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchNameOfCurrency() async throws -> [Currency] {
        guard let url = URL(string: API.currencyURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let currency = try? decoder.decode([Currency].self, from: data) else {
            throw NetworkError.DecodingError
        }
        return currency
    }
    
    func fetchImage(from url: String) throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidURL }
        guard let image = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return image
    }
}

enum API: String {
    case currencyURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
}
