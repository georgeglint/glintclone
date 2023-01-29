//
//  CurrenciesHomeCoordinator.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//
// Coordinator: Contains navigation logic between screens or views.

import UIKit

class CurrenciesHomeCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - CurrenciesHomeCoordinatorProtocol

extension CurrenciesHomeCoordinator: CurrenciesHomeCoordinatorProtocol {
    func presentThankYouView() {
        let navigationController = ThankYouViewController().embedInNavigationController() as NavigationController
        viewController?.present(navigationController, animated: true)
    }
}
