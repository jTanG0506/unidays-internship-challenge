//
//  main.swift
//  UnidaysInternshipChallenge
//
//  Created by Jonathan Tang on 18/02/2018.
//  Copyright © 2018 jtang0506. All rights reserved.
//

import Foundation

// Setup the sample products.
let productA = Product(name: "A", price: 8.00, rule: nil) // None
let productB = Product(name: "B", price: 12.00, rule: NForMPounds(n: 2, m: 20)) // 2 for £20
let productC = Product(name: "C", price: 4.00, rule: NForMPounds(n: 3, m: 10)) // 3 for £10
let productD = Product(name: "D", price: 7.00, rule: BuyXItemsGetYFree(x: 1, y: 1, itemPrice: 7.00)) // Buy 1 Get 1 Free
let productE = Product(name: "E", price: 5.00, rule: BuyXItemsGetYFree(x: 2, y: 1, itemPrice: 5.00)) // 3 for the price of 2

var example = UnidaysDiscountChallenge()
example.setItemRepository(to: [productA, productB, productC, productD, productE])

var basketString = ""
var result: (total: Double, delivery: Double) = (0, 0)

// Test Case 1
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 2
basketString = "A"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 3
basketString = "B"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 4
basketString = "C"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 5
basketString = "D"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 6
basketString = "E"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 7
basketString = "BB"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 8
basketString = "BBB"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 9
basketString = "BBBB"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 10
basketString = "CCC"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 11
basketString = "CCCC"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 12
basketString = "DD"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 13
basketString = "DDD"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 14
basketString = "EE"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 15
basketString = "EEE"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 16
basketString = "EEEE"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 17
basketString = "DDDDDDDDDDDDDD"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 18
basketString = "BBBBCCC"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 19
basketString = "ABBCCCDDEE"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")

example.clearBasket()
// Test Case 20
basketString = "EDCBAEDCBC"
example.addItemsToBasketWith(ids: basketString)
result = example.calculateTotalPrice()
print("[\(basketString)] ==> Total: \(result.total) Delivery: \(result.delivery)")
