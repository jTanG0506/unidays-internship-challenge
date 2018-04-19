//
//  UnidaysChallengeTests.swift
//  UnidaysChallengeTests
//
//  Created by Jonathan Tang on 19/04/2018.
//  Copyright © 2018 jtang0506. All rights reserved.
//

import XCTest
@testable import UnidaysInternshipChallenge

class UnidaysChallengeTests: XCTestCase {
  
  var instance = UnidaysDiscountChallenge()
  
  override func setUp() {
    super.setUp()
    
    // Setup the sample products.
    // None
    let productA = Product(name: "A", price: 8.00, rule: nil)
    // 2 for £20
    let productB = Product(name: "B", price: 12.00, rule: NForMPounds(n: 2, m: 20))
    // 3 for £10
    let productC = Product(name: "C", price: 4.00, rule: NForMPounds(n: 3, m: 10))
    // Buy 1 Get 1 Free
    let productD = Product(name: "D", price: 7.00, rule: BuyXItemsGetYFree(x: 1, y: 1, itemPrice: 7.00))
    // 3 for the price of 2
    let productE = Product(name: "E", price: 5.00, rule: BuyXItemsGetYFree(x: 2, y: 1, itemPrice: 5.00))
    
    instance.setItemRepository(to: [productA, productB, productC, productD, productE])
  }
  
  func tuplesMatch(_ input: (Double, Double), _ expected: (Double, Double)) -> Bool {
    return input.0 == expected.0 && input.1 == expected.1
  }
  
  // Test Case 1
  func testEmptyBasket() {
    let basket = ""
    let expected = (total: 0.0, delivery: 0.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Empty Basket Test Failed")
  }
  
  func testBasketWithOnlyOneProductA() {
    let basket = "A"
    let expected = (total: 8.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOnlyOneProductB() {
    let basket = "B"
    let expected = (total: 12.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOnlyOneProductC() {
    let basket = "C"
    let expected = (total: 4.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOnlyOneProductD() {
    let basket = "D"
    let expected = (total: 7.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOnlyOneProductE() {
    let basket = "E"
    let expected = (total: 5.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketBB() {
    let basket = "BB"
    let expected = (total: 20.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketBBB() {
    let basket = "BBB"
    let expected = (total: 32.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketBBBB() {
    let basket = "BBBB"
    let expected = (total: 40.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketCCC() {
    let basket = "CCC"
    let expected = (total: 10.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketCCCC() {
    let basket = "CCCC"
    let expected = (total: 14.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketDD() {
    let basket = "DD"
    let expected = (total: 7.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketDDD() {
    let basket = "DDD"
    let expected = (total: 14.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketEE() {
    let basket = "EE"
    let expected = (total: 10.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketEEE() {
    let basket = "EEE"
    let expected = (total: 10.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
  func testBasketWithOneTypeOfProductWhichInvokesDiscountWithBasketEEEE() {
    let basket = "EEEE"
    let expected = (total: 15.0, delivery: 7.0)
    
    instance.addItemsToBasketWith(ids: basket)
    let result = instance.calculateTotalPrice()
    XCTAssert(tuplesMatch(result, expected), "Basket '\(basket)' Failed")
  }
  
}
