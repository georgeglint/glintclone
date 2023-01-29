// swiftlint:disable:this file_name
//
//  CurrenciesHomeProtocols.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//
// Protocols: Defines interactions between the MVVM-C module components.

import Foundation

// MARK: - Coordinator
/// ViewModel -> Coordinator
protocol CurrenciesHomeCoordinatorProtocol: AnyObject, CoordinatorProtocol {
    func presentThankYouView()
}

// MARK: - Module
/// Module -> View
protocol CurrenciesHomeModuleProtocol: AnyObject {
}

// MARK: - View
/// ViewModel -> ViewController
protocol CurrenciesHomeViewProtocol: AnyObject {
    func setup()
    func layout()
    func update(with cellTypes: [CurrenciesCellType])
    
    var viewModel: CurrenciesHomeViewModelProtocol? { get set }
}

// MARK: - ViewModel
/// ViewController -> ViewModel
protocol CurrenciesHomeViewModelProtocol: AnyObject, ViewControllerLifecycleProtocol {
    func didTapViewNotifications()
    func didTapTopUp()
    func didTapBuyOrSell()
    func didTapGlintIt()
    func didTapCurrency(at indexPath: IndexPath)
    
    var view: CurrenciesHomeViewProtocol? { get }
    var coordinator: CurrenciesHomeCoordinatorProtocol { get }
}
