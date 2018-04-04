//
//  UnidaysDiscountChallenge.swift
//  UnidaysInternshipChallenge
//
//  Created by Jonathan Tang on 18/02/2018.
//  Copyright © 2018 jtang0506. All rights reserved.
//

import Foundation

class UnidaysDiscountChallenge {

  // A dictionary of products along with their quantity.
  var basket: [Product: Int] = [:]
  
  func addToBasket(item: Product?) {
    if let item = item {
      if basket[item] != nil {
        basket[item]! += 1
      } else {
        basket[item] = 1
      }
    }
  }
  
  func calculateTotalPrice() -> (Double, Double) {
    var total: Double = 0.0
    var delivery: Double = 0.0
    
    // Calculate the base price by the summation of 'product * quantity'.
    for (product, quantity) in basket {
      total += product.price * Double(quantity)
      
      if let rule = product.rule {
        total += rule.calculateDiscount(price: product.price, quantity: quantity)
      }
    }
    
    // Calculate delivery cost based on total cost (with edge case 0 items).
    delivery = basket.keys.count == 0 ? 0 : total >= 50 ? 0 : 7
    
    return (total, delivery)
  }
  
  // Dictionary of all available products, with their keys being their ID, in this case, the character.
  var allProducts: [String: Product] = [:]
  
  func setItemRepository(to items: [Product]) {
    allProducts.removeAll()
    
    for item in items {
      allProducts[item.name] = item
    }
  }
  
  /// Allows easy adding to basket as a list of ID's.
  ///
  /// - Parameter string: Product IDs, for example 'ABBA'
  func addItemsToBasketWith(ids: String) {
    for id in ids {
      if let product = allProducts[String(id)] {
        addToBasket(item: product)
      }
    }
  }
  
  // Clears the basket.
  func clearBasket() {
    basket.removeAll()
  }
}
