//
//  Currency.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import Foundation

struct Currency: Hashable {
    let code: String
    let value: String
    let conversionValue: String?
    let highlighted: Bool
    let baseCurrency: Bool
}
