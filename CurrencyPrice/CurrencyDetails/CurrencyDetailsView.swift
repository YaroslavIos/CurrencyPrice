//
//  CurrencyDetailsView.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import SwiftUI

struct CurrencyDetailsView: View {
    @StateObject var viewModel: CurrencyDetailsViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    ImageView(image: viewModel.image, imageSize: CGSize(width: 80, height: 80), cornerRadius: 12)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$\(viewModel.currentPrice)")
                            .font(.title)
                        
                        HStack {
                            Image(systemName: viewModel.priceChanged > 0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                                .font(.subheadline)
                                .foregroundColor(viewModel.priceChanged > 0 ? Color.green : Color.red)
                            Text("$\(viewModel.priceChanged)")
                                .font(.subheadline)
                                .foregroundColor(viewModel.priceChanged > 0 ? Color.green : Color.red)
                            Text("(\(viewModel.priceChangedPercentage)%)")
                                .font(.subheadline)
                                .foregroundColor(viewModel.priceChanged > 0 ? Color.green : Color.red)
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Form {
                    Section(header: Text("Main")) {
                        HStack {
                            Text("Name")
                            Spacer()
                            Text("\(viewModel.currencyName)")
                        }
                        HStack {
                            Text("Current price")
                            Spacer()
                            Text("$\(viewModel.currentPrice)")
                        }
                        HStack {
                            Text("Symbol")
                            Spacer()
                            Text("\(viewModel.symbol)")
                        }
                        HStack {
                            Text("Rank")
                            Spacer()
                            Text("# \(viewModel.rank)")
                        }
                    }
                }
                
                Form {
                    Section(header: Text("Additional")) {
                        HStack {
                            Text("Price changed")
                            Spacer()
                            Text("\(viewModel.priceChanged)")
                        }
                        HStack {
                            Text("High")
                            Spacer()
                            Text("\(viewModel.highPrice)")
                        }
                        HStack {
                            Text("Low")
                            Spacer()
                            Text("\(viewModel.lowPrice)")
                        }
                        Text("\(viewModel.lastUpdate)")
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
//            .padding(.leading, 10)
//            .padding(.trailing, 10)
//            .padding(.top, 10)
        }
    }
}


//struct CurrencyDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyDetailsView(viewModel: CurrencyDetailsViewModel(currency: Currency.getCurrency(from: Currency))
//    }
//}
