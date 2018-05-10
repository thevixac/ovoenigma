//
//  Alphabet.swift
//  VxEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/*
 For an ordered unique list of symbols, Alphabet provides constant lookup time conversions between a given symbol and the index.
 */
struct Alphabet<Symbol: Hashable> {
    
    private var symbolArray : [Symbol] = []
    private var symbolMap: [Symbol : Int] = [:]
    
    init(orderedSymbols: [Symbol]) {
        for (index, c) in orderedSymbols.enumerated() {
            symbolArray.append(c)
            symbolMap[c] = index
        }
    }
    
    func size() -> Int {
        return symbolArray.count
    }
    func getIndex(symbol: Symbol) -> Int {
        return symbolMap[symbol]!
    }
    func getSymbol(index: Int) -> Symbol {
        return symbolArray[index]
    }
}
