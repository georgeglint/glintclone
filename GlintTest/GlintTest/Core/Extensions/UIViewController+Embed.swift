//
//  UIViewController+Embed.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

extension UIViewController {
    func embedInNavigationController<T: UINavigationController>() -> T {
        T(rootViewController: self)
    }
}
