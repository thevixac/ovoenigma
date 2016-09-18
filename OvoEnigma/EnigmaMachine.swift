//
//  EnigmaMachine.swift
//  OvoEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/**
  Slightly more general purpose enigma machine than required for this code test. Takes
 any number of rotors and can work for any hashable type. Rotations occur on the first rotor each time a symbol is encrypted. Subsequent rotors rotate when the previous rotor has done a full circle.
 */
struct EnigmaMachine<Symbol: Hashable> {
    
    var rotors: [Rotor<Symbol>]
    let reflector: Rotor<Symbol> 
    init(rotors:[Rotor<Symbol>], reflector: Rotor<Symbol>) {
        self.rotors = rotors
        self.reflector = reflector
    }
    
    func encrypt(message: [Symbol]) -> [Symbol] {
        var encryptedMessage : [Symbol] = []
        for symbol in message {
            self.applyRotations()
            encryptedMessage.append(self.encryptSymbol(symbol))
        }
        return encryptedMessage
    }
    
    private func encryptSymbol(symbol: Symbol) -> Symbol {
        var currentSymbol = symbol
        for r in rotors {
            currentSymbol = r.scrambleForwards(currentSymbol)
        }
        currentSymbol = reflector.scrambleForwards(currentSymbol)
        for r in rotors.reverse() {
            currentSymbol = r.scrambleBackwards(currentSymbol)
        }
        return currentSymbol
    }
    
    private func applyRotations() {
        for var r in rotors {
            if !r.rotate() {
                break
            }
        }
    }
    
}

