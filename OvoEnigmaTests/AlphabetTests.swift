//
//  OvoEnigmaTests.swift
//  OvoEnigmaTests
//
//  Created by vic on 18/09/2016.
//  Copyright © 2016 vic. All rights reserved.
//

import XCTest
import Nimble

@testable import OvoEnigma

class AlphabetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAlphabetWithNumbers() {
        let a = Alphabet<Int>(orderedSymbols: [9,8,7,6,5,4,3,2,1,0])
        expect(a.getIndex(2)).to(equal(7))
        expect(a.getSymbol(9)).to(equal(0))
        expect(a.size()).to(equal(10))
    }
    
    func testAlphabetWithFruits() {
        let a = Alphabet<Fruit>(orderedSymbols:[.Apple, .Banana, .Mango])
        expect(a.getSymbol(2)).to(equal(Fruit.Mango))
        expect(a.getIndex(Fruit.Banana)).to(equal(1))
        expect(a.size()).to(equal(3))
    }
    
    func testEmptyAlphabet() {
        let a = Alphabet<Character>(orderedSymbols: [])
        expect(a.size()).to(equal(0))
    }
}


private enum Fruit : String {
    case Apple = "Apple"
    case Banana = "Banana"
    case Mango = "Mango"
}