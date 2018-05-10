//
//  vxenigmaTests.swift
//  vxenigmaTests
//
//  Created by vic on 09/05/2018.
//  Copyright © 2018 vixac. All rights reserved.
//

import XCTest
@testable import vxenigma

class AlphabetTests: XCTestCase {
    
    private enum Fruit : String {
        case apple = "apple"
        case banana = "banana"
        case mango = "mango"
    }
    
    func testAlphabetWithNumbers() {
        let a = Alphabet<Int>(orderedSymbols: [9,8,7,6,5,4,3,2,1,0])
        XCTAssertEqual(a.getIndex(symbol: 2), 7)
        XCTAssertEqual(a.getIndex(symbol: 9), 0)
        XCTAssertEqual(a.size(), 10)
    }
    
    func testAlphabetWithFruits() {
        let a = Alphabet<Fruit>(orderedSymbols:[.apple, .banana, .mango])
        XCTAssertEqual(a.getSymbol(index: 2), Fruit.mango)
        XCTAssertEqual(a.getIndex(symbol: Fruit.banana), 1)
        XCTAssertEqual(a.size(), 3)
    }
    
    func testEmptyAlphabet() {
        let a = Alphabet<Character>(orderedSymbols: [])
        XCTAssertEqual(a.size(),0)
    }

}
