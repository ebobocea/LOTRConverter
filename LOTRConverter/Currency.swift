//
//  Currency.swift
//  LOTRConverter
//
//  Created by Elisei Bobocea on 18/10/2022.
//

import Foundation

enum Currency: Double, CaseIterable{
    case copperPenny = 640
    case silverPenny = 64
    case goldPenny = 16
    case silverPiece = 4
    case goldPiece = 1
    
    func convert(amountString: String, to currency: Currency) -> String{
        guard let startAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount =  (startAmount / self.rawValue) * currency.rawValue
        
        if convertedAmount > 0{
            return String(format: "%.2f", convertedAmount)
        } else {
            return ""
        }
    }
}

enum CurrencyImage: String, CaseIterable{
    case copperPenny = "copperpenny"
    case silverPenny = "silverpenny"
    case goldPenny = "goldpenny"
    case silverPiece = "silverpiece"
    case goldPiece = "goldpiece"
}

enum CurrencyText: String, CaseIterable{
    case copperPenny = "Copper Penny"
    case silverPenny = "Silver Penny"
    case goldPenny = "Gold Penny"
    case silverPiece = "Silver Piece"
    case goldPiece = "Gold Piece"
}
