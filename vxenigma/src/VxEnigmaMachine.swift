//
//  VxEnigmaMachine.swift
//  VxEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/**
 The VxEnigma machine uses lower case characters with 3 rotors with pre defined sequences. 
 */
class VxEnigmaMachine {
    
    private static let lowercaseAlphabet: String =  "abcdefghijklmnopqrstuvwxyz"
    private var machine: EnigmaMachine<Character>
    
    init() {
        
        let alphabet =  Alphabet(orderedSymbols: Array(VxEnigmaMachine.lowercaseAlphabet))
        
        let rotorWirings = [
            "ekmflgdqvzntowyhxuspaibrcj",
            "ajdksiruxblhwtmcqgznpyfvoe",
            "bdfhjlcprtxvznyeiwgakmusqo"
        ]
        
        let rotors = rotorWirings.map { return Rotor(alphabet: alphabet, sequence: Array($0)) }
        
        let reflector = Rotor(alphabet: alphabet, sequence: Array("ejmzalyxvbwfcrquontspikhgd"))
        machine = EnigmaMachine(rotors: rotors , reflector: reflector)
        
    }
    
    /**
      Ignore all symbols that are not part of the lowercase alphabet.
    */
    static func clean(message: String) -> String {
        
        let lowercase = message.lowercased()
        var cleanString = ""
        for character in lowercase {
            if lowercaseAlphabet.range(of: String(character)) != nil  {
                cleanString.append(character)
            }
        }
        return cleanString
    }
    
    
    func encrypt(message: String) -> String {
        let inputSymbols = Array(message.lowercased())
        return String(machine.encrypt(message: inputSymbols))
    }
    
    
}
