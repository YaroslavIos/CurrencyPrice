//
//  ImageView.swift
//  CurrencyPrice
//
//  Created by Ярослав Любиченко on 10.9.2023.
//

import SwiftUI

struct ImageView: View {
    let image: Data
    let imageSize: CGSize
    let cornerRadius: CGFloat
    
    var body: some View {
        getImage(from: image)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(cornerRadius)
    }
    
    private func getImage(from data: Data) -> Image {
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
        }
        return Image(uiImage: image)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(
            image: Data(),
            imageSize: CGSize(width: 150, height: 150),
            cornerRadius: 20
        )
    }
}
