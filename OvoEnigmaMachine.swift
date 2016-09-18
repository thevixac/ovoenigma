//
//  OvoEnigmaMachine.swift
//  OvoEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import Foundation

/**
 The OvoEnigma machine uses lower case characters with 3 rotors with pre defined sequences. 
 */
class OvoEnigmaMachine {
    
    private static let lowercaseAlphabet: String =  "abcdefghijklmnopqrstuvwxyz"
    private var machine: EnigmaMachine<Character>
    
    init() {
        
        let alphabet =  Alphabet(orderedSymbols: Array(OvoEnigmaMachine.lowercaseAlphabet.characters))
        
        let rotorWirings = [
            "ekmflgdqvzntowyhxuspaibrcj",
            "ajdksiruxblhwtmcqgznpyfvoe",
            "bdfhjlcprtxvznyeiwgakmusqo"
        ]
        
        let rotors = rotorWirings.map { return Rotor(alphabet: alphabet, sequence: Array($0.characters)) }
        
        let reflector = Rotor(alphabet: alphabet, sequence: Array("ejmzalyxvbwfcrquontspikhgd".characters))
        machine = EnigmaMachine(rotors: rotors , reflector: reflector)
        
    }
    
    /**
      Ignore all symbols that are not part of the lowercase alphabet.
    */
    static func clean(message:String) -> String {
        
        let lowercase = message.lowercaseString
        var cleanString = ""
        for character in lowercase.characters {
            if lowercaseAlphabet.containsString(String(character)) {
                cleanString.append(character)
            }
        }
        return cleanString
    }
    
    
    func encrypt(message: String) -> String {
        let inputSymbols = Array(message.lowercaseString.characters)
        return String(machine.encrypt(inputSymbols))
    }
    
    
}