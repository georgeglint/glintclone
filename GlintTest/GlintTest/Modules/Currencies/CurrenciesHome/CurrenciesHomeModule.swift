//
//  CurrenciesHomeModule.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//
// Module: Responsible for building the MVVM-C module, using dependency injection for external services.

import UIKit

class CurrenciesHomeModule: CurrenciesHomeModuleProtocol {
    // MARK: - Lifecycle
    
    private init() { }
    
    // MARK: - Public Methods
    
    static func build() -> UIViewController {
        let view = CurrenciesHomeViewController()
        let coordinator = CurrenciesHomeCoordinator()
        let viewModel = CurrenciesHomeViewModel(view: view, coordinator: coordinator)

        view.viewModel = viewModel
        coordinator.viewController = view

        return view
    }
}
