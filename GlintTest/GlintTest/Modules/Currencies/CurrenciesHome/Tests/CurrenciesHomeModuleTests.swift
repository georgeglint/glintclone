//
//  CurrenciesHomeModuleTests.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import XCTest

class CurrenciesHomeModuleTests: XCTestCase {
    // MARK: - Properties
    
    var viewController: UIViewController!
    
    // MARK: - Lifecycle

    override func setUp() {
        viewController = CurrenciesHomeModule.build()
    }
    
    // MARK: - Test Methods
    
    func testView() throws {
        let view = try XCTUnwrap(viewController as? CurrenciesHomeViewController)
        
        XCTAssertNotNil(view.viewModel as? CurrenciesHomeViewModel)
    }
    
    func testViewModel() throws {
        let view = try XCTUnwrap(viewController as? CurrenciesHomeViewController)
        let viewModel = try XCTUnwrap(view.viewModel as? CurrenciesHomeViewModel)
        let coordinator = try XCTUnwrap(viewModel.coordinator as? CurrenciesHomeCoordinator)
        
        let viewModelView = try XCTUnwrap(viewModel.view as? CurrenciesHomeViewController)
        let viewModelCoordinator = try XCTUnwrap(viewModel.coordinator as? CurrenciesHomeCoordinator)
        
        XCTAssertEqual(view, viewModelView)
        XCTAssertTrue(coordinator === viewModelCoordinator)
    }
    
    func testCoordinator() throws {
        let view = try XCTUnwrap(viewController as? CurrenciesHomeViewController)
        let viewModel = try XCTUnwrap(view.viewModel as? CurrenciesHomeViewModel)
        let coordinator = try XCTUnwrap(viewModel.coordinator as? CurrenciesHomeCoordinator)
        
        XCTAssertEqual(coordinator.viewController, view)
    }
}
