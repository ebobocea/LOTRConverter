//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    
    var body: some View {
        ZStack {
            //Bacground image
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                //Poney Image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                //Currency conversion section
                HStack{
                    //Left conversion section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Image
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        //Text Field
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                    }
                    //Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    //Right converson section
                    VStack{
                        //Currency
                        HStack{
                            //Currency Text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                            //Currency Image
                            Image("goldpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        //Text Field
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(30)

                Spacer()
                //Info Button
                
                HStack {
                    Spacer()
                    Button {
                        // Display exhange info
                    } label: {
                        Image(systemName: "info.circle.fill")
                        
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
