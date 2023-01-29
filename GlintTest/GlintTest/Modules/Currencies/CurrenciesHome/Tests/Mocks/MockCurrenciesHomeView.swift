//
//  MockCurrenciesHomeView.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import UIKit

class MockCurrenciesHomeView {
    // MARK: - Properties
    
    var viewModel: CurrenciesHomeViewModelProtocol?
    
    // MARK: - Test Properties
    
    var setupCalled = false
    var layoutCalled = false
    var updateCalled = false
}

// MARK: - CurrenciesHomeViewProtocol

extension MockCurrenciesHomeView: CurrenciesHomeViewProtocol {
    func setup() {
        setupCalled = true
    }
    
    func layout() {
        layoutCalled = true
    }
    
    func update(with cellTypes: [GlintTest.CurrenciesCellType]) {
        updateCalled = true
    }
}
