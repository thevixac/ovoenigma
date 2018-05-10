//
//  RotorTests.swift
//  vxenigmaTests
//
//  Created by vic on 10/05/2018.
//  Copyright © 2018 vixac. All rights reserved.
//

import XCTest
@testable import vxenigma
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
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 1), 3)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 3), 1)
        
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 2), 2)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 2), 2)
        
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 3), 1)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 1), 3)
    }
    
    func testRotation() {
        /*
         [1 2 3] //base
         [3 2 1] //rotor
         */
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 1), 3)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 3), 1)
        XCTAssertFalse(self.rotor.rotate())
        
        /*
         [1 2 3] //base
         [2 1 3] //rotor
         */
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 1), 2)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 2), 1)
        XCTAssertFalse(self.rotor.rotate())
        
        /*
         [1 2 3] //base
         [1 3 2] //rotor
         */
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 1), 1)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 1), 1)
        XCTAssertTrue(self.rotor.rotate())
        
        /*
         [1 2 3] //base
         [3 2 1] //rotor
         */
        XCTAssertEqual(self.rotor.scrambleForwards(symbol: 3), 1)
        XCTAssertEqual(self.rotor.scrambleBackwards(symbol: 1), 3)
        XCTAssertFalse(self.rotor.rotate())
    }
}
