//
//  ProductAndRules.swift
//  UnidaysInternshipChallenge
//
//  Created by Jonathan Tang on 18/02/2018.
//  Copyright © 2018 jtang0506. All rights reserved.
//

import Foundation

/// Structure for a single product.
/// Assuming that each product can only have a single discount rule, however it is easy to extend.
struct Product: Hashable {
  var name: String = ""
  var price: Double = 0.0
  var rule: DiscountRule?
  
  /// Assume product names are unique, hence the default hash for the name will suffice.
  /// Product must be Hashable so that we can use it as the key in the dictionary (see UnidaysDiscountChallenge.swift).
  var hashValue: Int {
    return name.hashValue
  }
  
  static func == (lhs: Product, rhs: Product) -> Bool {
    return lhs.name == rhs.name && lhs.price == rhs.price
  }
}

/// Discount rules which assume that a rule can only apply to a single product.
/// i.e. There cannot be a rule saying "Buy product X and get product Y for free".
protocol DiscountRule {
  func calculateDiscount(price: Double, quantity: Int) -> Double
}

/// Buy N items for M pounds.
class NForMPounds: DiscountRule {
  var n: Int
  var offerPrice: Double
  
  init(n: Int, m: Double) {
    self.n = n
    self.offerPrice = m
  }
  
  /// Calculates the discount to apply for a given product and the quantity present in basket.
  ///
  /// - Parameters:
  ///   - price: Original price of a single item
  ///   - quantity: Quantity in basket
  /// - Returns: Savings by discount, for example, saving £10 returns -10.0
  func calculateDiscount(price: Double, quantity: Int) -> Double {
    return Double(quantity / n) * -(Double(n) * price - offerPrice)
  }
}

// Buy X items and get Y items free.
class BuyXItemsGetYFree: NForMPounds {
  // This is essentially the same as buy (X + Y) items for (X * price) pounds.
  init(x: Int, y: Int, itemPrice: Double) {
    super.init(n: x + y, m: Double(x) * itemPrice)
  }
}
