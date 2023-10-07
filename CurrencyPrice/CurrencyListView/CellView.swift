//
//  CellView.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import SwiftUI

struct CellView: View {
    let viewModel: CurrencyDetailsViewModel
    
    var body: some View {
        HStack {
            ImageView(
                image: viewModel.image,
                imageSize: CGSize(width: 60, height: 60),
                cornerRadius: 12
            )
            VStack(alignment: .leading) {
                Text(viewModel.currencyName)
                Text(viewModel.symbol)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellView()
//    }
//}
