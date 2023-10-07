//
//  CurrentListView.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 8.9.2023.
//

import SwiftUI

struct CurrentListView: View {
    @StateObject private var viewModel = CurrencyListViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.rows, id: \.currencyName) {
                currencyDetailsViewModel in NavigationLink(destination: CurrencyDetailsView(viewModel: currencyDetailsViewModel)) {
                    CellView(viewModel: currencyDetailsViewModel)
                }
                .navigationTitle("Markets")
            }
        }
        .task {
            await viewModel.fetchCurrency()
        }
    }
}

struct CurrentListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentListView()
    }
}
