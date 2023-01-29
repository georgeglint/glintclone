//
//  CurrenciesHomeViewModelTests.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import XCTest

class CurrenciesHomeViewModelTests: XCTestCase {
    // MARK: - Properties
    
    var viewModel: CurrenciesHomeViewModel!
    var view: MockCurrenciesHomeView!
    var coordinator: MockCurrenciesHomeCoordinator!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        view = MockCurrenciesHomeView()
        coordinator = MockCurrenciesHomeCoordinator()
        viewModel = CurrenciesHomeViewModel(view: view, coordinator: coordinator)
    }
    
    // MARK: - Test Methods
    
    func testWhenViewDidLoadCalled_ThenViewIsSetUp() {
        viewModel.viewDidLoad()
        
        XCTAssertTrue(view.setupCalled)
        XCTAssertTrue(view.layoutCalled)
        XCTAssertTrue(view.updateCalled)
    }
    
    func testWhenMockDataSourceAccessed_ThenContainsCorrectItems() {
        XCTAssertEqual(viewModel.mockDataSource.count, Constants.expectedDataSourceCount)
        XCTAssertTrue(viewModel.mockDataSource.contains(.verify))
        
        let currencies = viewModel.mockDataSource.compactMap { cellType -> Currency? in
            switch cellType {
            case .verify: return nil
            case .currency(let currency): return currency
            }
        }
        
        let supportedCurrencies = ["GOLD", "GBP", "EUR", "USD"]
        supportedCurrencies.forEach { code in
            XCTAssertTrue(currencies.contains(where: { $0.code == code }))
        }
    }
}

// MARK: - Constants

extension CurrenciesHomeViewModelTests {
    private struct Constants {
        static let expectedDataSourceCount: Int = 5
    }
}
