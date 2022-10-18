//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI


struct IconGrid: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: gridLayout){
            ForEach(0..<5){i in
                if Currency.allCases[i] == currency{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyName: CurrencyText.allCases[i].rawValue)
                        .shadow(color: .black, radius: 9)
                }else{
                    CurrencyIcon(currencyImage: CurrencyImage.allCases[i].rawValue, currencyName: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        }
    }
}

struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid( currency: .constant(.goldPiece))
    }
}
