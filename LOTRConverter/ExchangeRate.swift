//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    
    
    
    var body: some View {
        //Exchange rates
        HStack{
            //left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            //Exchange rate text
            Text(text)
            //right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
            .previewLayout(.sizeThatFits)
    }
}
