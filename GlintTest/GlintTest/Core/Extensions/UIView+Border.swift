//
//  UIView+Border.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import UIKit

extension UIView {
    // MARK: - Enums
    
    enum Side {
        case left, right, top, bottom
    }
    
    // MARK: - Public Methods

    func addBorder(to side: Side, color: UIColor, weight: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor

        switch side {
        case .left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: weight, height: frame.height)
        case .right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: weight, height: frame.height)
        case .top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: weight)
        case .bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: weight)
        }

        layer.addSublayer(border)
    }
}
