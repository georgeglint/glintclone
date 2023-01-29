//
//  MockCurrenciesHomeCoordinator.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import UIKit

class MockCurrenciesHomeCoordinator {
    // MARK: - Properties
    
    var viewController: UIViewController?
    
    // MARK: - Test Properties
    
    var presentThankYouViewCalled = false
}

// MARK: - CurrenciesHomeCoordinatorProtocol

extension MockCurrenciesHomeCoordinator: CurrenciesHomeCoordinatorProtocol {
    func presentThankYouView() {
        presentThankYouViewCalled = true
    }
}
