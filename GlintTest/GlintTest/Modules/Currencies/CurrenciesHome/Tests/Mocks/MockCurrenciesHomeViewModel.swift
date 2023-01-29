//
//  MockCurrenciesHomeViewModel.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import Foundation
@testable import GlintTest

class MockCurrenciesHomeViewModel {
    // MARK: - Properties
    
    var view: CurrenciesHomeViewProtocol?
    var coordinator: CurrenciesHomeCoordinatorProtocol = MockCurrenciesHomeCoordinator()
    
    // MARK: - Test Properties

    var viewDidLoadCalled = false
    var didTapViewNotificationsCalled = false
    var didTapTopUpCalled = false
    var didTapBuyOrSellCalled = false
    var didTapGlintItCalled = false
    var didTapCurrencyCalled = false
}

// MARK: - CurrenciesHomeViewModelProtocol

extension MockCurrenciesHomeViewModel: CurrenciesHomeViewModelProtocol {
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    func didTapViewNotifications() {
        didTapViewNotificationsCalled = true
    }
    
    func didTapTopUp() {
        didTapTopUpCalled = true
    }
    
    func didTapBuyOrSell() {
        didTapBuyOrSellCalled = true
    }
    
    func didTapGlintIt() {
        didTapGlintItCalled = true
    }
    
    func didTapCurrency(at indexPath: IndexPath) {
        didTapCurrencyCalled = true
    }
}
