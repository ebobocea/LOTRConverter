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
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    @State var showSelectedCurrency =  false
    @State var showExchangeView = false
    
    
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
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //Currency Text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectedCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        //Text Field
                        TextField("Amount", text: $leftAmount, onEditingChanged: { typing  in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp){_ in
                                rightAmount =  leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                            .onChange(of: leftCurrency){_ in
                                leftAmount =  rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
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
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundColor(.white)
                            //Currency Image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectedCurrency){
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        }
                        //Text Field
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                        })
                            .padding(7)
                            .background(Color(uiColor: .systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp){_ in
                                leftAmount =  rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                            .onChange(of: rightCurrency){_ in
                                rightAmount =  leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
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
                        showExchangeView.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                        
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeView){
                        ExchangeInfo()
                    }
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
