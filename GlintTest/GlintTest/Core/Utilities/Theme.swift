//
//  Theme.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

struct Theme {
    private init() { }
    struct Font { private init() { } }
    struct Spacing { private init() { } }
}

// MARK: - Font

extension Theme.Font {
    static let extraLargeHeading: UIFont = .boldSystemFont(ofSize: 30)
    static let heading: UIFont = .boldSystemFont(ofSize: 20)
    static let body: UIFont = .systemFont(ofSize: 16)
    static let subheading: UIFont = .systemFont(ofSize: 14)
}

// MARK: - Spacing

extension Theme.Spacing {
    static let extraSmall: CGFloat = 5
    static let small: CGFloat = 10
    static let mediumSmall: CGFloat = 15
    static let medium: CGFloat = 20
    static let mediumLarge: CGFloat = 25
    static let large: CGFloat = 30
    static let extraLarge: CGFloat = 40
}
