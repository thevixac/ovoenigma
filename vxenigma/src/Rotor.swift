//
//  Rotor.swift
//  VxEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/**
 Rotor takes a base alphabet and a jumbled sequence of the same alphabet, which can rotate.
  If you instantiate a rotor as a let constant, you have yourself a reflector.
 */
struct Rotor<Symbol: Hashable> {
    
    let alphabet : Alphabet<Symbol>
    let sequence: [Symbol]
    var currentPosition : Int = 0
    init(alphabet: Alphabet<Symbol>, sequence: [Symbol]) {
        self.alphabet = alphabet
        self.sequence = sequence
    }
    
    mutating func rotate() -> Bool {
        currentPosition += 1
        if currentPosition >= sequence.count {
            currentPosition = 0
            return true
        }
        return false
    }
    
    func scrambleForwards(symbol: Symbol) -> Symbol {
        let alphabetPosition = alphabet.getIndex(symbol: symbol)
        return sequence[(alphabetPosition + currentPosition) % alphabet.size()]
    }
    
    func scrambleBackwards(symbol: Symbol) -> Symbol {
        var offset  : Int = 0
        for (index, _) in sequence.enumerated() {
            let offsetSymbol = sequence[(index + currentPosition) % sequence.count]
            if offsetSymbol == symbol {
                offset = index
            }
        }
        return alphabet.getSymbol(index: offset)
    }
}
