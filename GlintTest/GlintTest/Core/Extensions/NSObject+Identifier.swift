//
//  NSObject+Identifier.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import Foundation

extension NSObject {
    static var identifier: String {
        String(describing: self)
    }
}
