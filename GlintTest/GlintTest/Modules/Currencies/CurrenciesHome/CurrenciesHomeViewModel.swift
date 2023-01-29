//
//  CurrenciesHomeViewModel.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//
// ViewModel: Contains the business logic of the module. Responsible for communicating with the view, coordinator and external services if applicable.

import Foundation

// MARK: - CurrenciesCellType

enum CurrenciesCellType: Hashable {
    case verify
    case currency(Currency)
}

// MARK: - CurrenciesHomeViewModel

class CurrenciesHomeViewModel {
    // MARK: - CurrenciesHomeViewModelProtocol
    
    weak var view: CurrenciesHomeViewProtocol?
    var coordinator: CurrenciesHomeCoordinatorProtocol
    
    // MARK: - Properties
    
    let mockDataSource: [CurrenciesCellType] = [
        .verify,
        .currency(Currency(code: "GOLD", value: "0.0000g", conversionValue: "0.00 GBP", highlighted: true, baseCurrency: false)),
        .currency(Currency(code: "GBP", value: "0.00 GBP", conversionValue: nil, highlighted: false, baseCurrency: true)),
        .currency(Currency(code: "EUR", value: "0.00", conversionValue: "0.00 GBP", highlighted: false, baseCurrency: false)),
        .currency(Currency(code: "USD", value: "0.00", conversionValue: "0.00 GBP", highlighted: false, baseCurrency: false))
    ]
    
    // MARK: - Lifecycle

    init(view: CurrenciesHomeViewProtocol, coordinator: CurrenciesHomeCoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
    }
    
    // MARK: - Private Methods
    
    private func presentThankYou() {
        coordinator.presentThankYouView()
    }
}

// MARK: - CurrenciesHomeViewModelProtocol

extension CurrenciesHomeViewModel: CurrenciesHomeViewModelProtocol {
    func viewDidLoad() {
        view?.setup()
        view?.layout()
        view?.update(with: mockDataSource)
    }
    
    func didTapViewNotifications() {
        presentThankYou()
    }
    
    func didTapTopUp() {
        presentThankYou()
    }
    
    func didTapBuyOrSell() {
        presentThankYou()
    }
    
    func didTapGlintIt() {
        presentThankYou()
    }
    
    func didTapCurrency(at indexPath: IndexPath) {
        presentThankYou()
    }
}
