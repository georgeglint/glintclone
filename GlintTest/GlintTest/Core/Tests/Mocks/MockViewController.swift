//
//  MockViewController.swift
//  GlintTestTests
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

class MockViewController: UIViewController {
    // MARK: - Test Properties

    var presentCalled: UIViewController?

    // MARK: - Override Methods

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        presentCalled = viewControllerToPresent
        completion?()
    }
}
