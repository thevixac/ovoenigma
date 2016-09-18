//
//  RotorTests.swift
//  OvoEnigma
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import XCTest
import Nimble

@testable import OvoEnigma

class RotorTests: XCTestCase {
    
    
    var rotor : Rotor<Int>!
    override func setUp() {
        rotor = Rotor(alphabet: Alphabet(orderedSymbols: [1,2,3]), sequence: [3,2,1])
    }
    
    func testScrambles() {
        /*
         [1 2 3] //base
         [3 2 1] //rotor
         */
        expect(self.rotor.scrambleForwards(1)).to(equal(3))
        expect(self.rotor.scrambleBackwards(3)).to(equal(1))
        
        expect(self.rotor.scrambleForwards(2)).to(equal(2))
        expect(self.rotor.scrambleBackwards(2)).to(equal(2))
        
        expect(self.rotor.scrambleForwards(3)).to(equal(1))
        expect(self.rotor.scrambleBackwards(1)).to(equal(3))
    }
    
    
    func testRotation() {
        
        /* 
            [1 2 3] //base
            [3 2 1] //rotor
        */
        expect(self.rotor.scrambleForwards(1)).to(equal(3))
        expect(self.rotor.scrambleBackwards(3)).to(equal(1))
        expect(self.rotor.rotate()).to(beFalse())
        
        /*
            [1 2 3] //base
            [2 1 3] //rotor
         */
        expect(self.rotor.scrambleForwards(1)).to(equal(2))
        expect(self.rotor.scrambleBackwards(2)).to(equal(1))
        expect(self.rotor.rotate()).to(beFalse())
        
        /*
            [1 2 3] //base
            [1 3 2] //rotor
         */
        expect(self.rotor.scrambleForwards(1)).to(equal(1))
        expect(self.rotor.scrambleBackwards(1)).to(equal(1))
        expect(self.rotor.rotate()).to(beTrue())
        
        /*
            [1 2 3] //base
            [3 2 1] //rotor
         */
        expect(self.rotor.scrambleForwards(1)).to(equal(3))
        expect(self.rotor.scrambleBackwards(3)).to(equal(1))
        expect(self.rotor.rotate()).to(beFalse())
    }
   
}