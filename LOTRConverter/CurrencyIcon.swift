//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var currencyImage: String
    @State var currencyName: String


    var body: some View {
        //Currency icons
        ZStack{
            //Currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            //Currency text
            VStack {
                Spacer()
                Text(currencyName)
                    .padding(3)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
            }
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .cornerRadius(25)
    }
}

struct CurrencyIcon_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyIcon(currencyImage: "copperpenny", currencyName: "copper penny")
            .previewLayout(.sizeThatFits)
    }
}
