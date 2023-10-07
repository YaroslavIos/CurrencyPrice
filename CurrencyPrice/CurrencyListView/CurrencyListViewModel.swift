//
//  CurrencyListViewModel.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import SwiftUI

class CurrencyListViewModel: ObservableObject {
    @Published var rows: [CurrencyDetailsViewModel] = []
    
    func fetchCurrency() async {
        do {
            let currencies = try await NetworkManager.shared.fetchNameOfCurrency()
            rows = currencies.map { CurrencyDetailsViewModel(currency: $0)}
        } catch {
            print(error)
        }
    }
}
