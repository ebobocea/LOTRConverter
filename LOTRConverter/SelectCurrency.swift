//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI

struct SelectCurrency: View {
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
                ZStack{
                    //Currency image
                    Image("copperpenny")
                        .resizable()
                        .scaledToFit()
                    
                    //Currency text
                    VStack {
                        Spacer()
                        Text("Copper Penny")
                            .padding()
                            .font(.caption)
                            .background(.brown.opacity(0.75))
                    }
                    
                }
                .padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .cornerRadius(25)
                
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //Currency icons
                
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
        SelectCurrency()
    }
}
