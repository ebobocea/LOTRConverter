//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI

struct SelectCurrency: View {
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image("parchment")
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                //Text
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Currency icons
                IconGrid(currency: $leftCurrency)
                
                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //Currency icons
                IconGrid(currency: $rightCurrency)
                
                //Done button
                Button("Done"){
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundColor(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
