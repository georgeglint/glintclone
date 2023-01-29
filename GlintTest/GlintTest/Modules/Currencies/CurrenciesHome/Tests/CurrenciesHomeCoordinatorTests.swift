//
//  CurrenciesHomeCoordinatorTests.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import XCTest

class CurrenciesHomeCoordinatorTests: XCTestCase {
    // MARK: - Properties
    
    var coordinator: CurrenciesHomeCoordinator!
    var viewController: MockViewController!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        viewController = MockViewController()
        coordinator = CurrenciesHomeCoordinator()
        coordinator.viewController = viewController
    }
    
    // MARK: - Test Methods
    
    func testWhenPresentThankYouView_ThenIsShown() throws {
        coordinator.presentThankYouView()
        
        let navigationController = try XCTUnwrap(viewController.presentCalled as? NavigationController)
        XCTAssertTrue(navigationController.viewControllers.first is ThankYouViewController)
    }
}
