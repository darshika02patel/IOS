//
//  NumberFormatter.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }
}
