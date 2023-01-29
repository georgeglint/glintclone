//
//  CurrenciesHomeViewControllerTests.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

@testable import GlintTest
import XCTest

class CurrenciesHomeViewControllerTests: XCTestCase {
    // MARK: - Properties
    
    var view: CurrenciesHomeViewController!
    var viewModel: MockCurrenciesHomeViewModel!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        view = CurrenciesHomeViewController()
        view.loadViewIfNeeded()
        viewModel = MockCurrenciesHomeViewModel()
        view.viewModel = viewModel
    }
    
    // MARK: - Test Methods
    
    func testWhenViewLoads_ThenViewModelCalled() {
        view.viewDidLoad()
        
        XCTAssertTrue(viewModel.viewDidLoadCalled)
    }
    
    func testWhenSetupCalled_ThenCompletesAllActions() {
        view.setup()
        
        XCTAssertEqual(view.view.backgroundColor, Asset.Colors.glintGreenDark.color)
        XCTAssertEqual(view.title, L10n.dCurrencies)
        XCTAssertEqual(view.navigationItem.rightBarButtonItem, view.notificationButtonItem)
        XCTAssertTrue(view.currenciesHomeView.tableView.dataSource === view.dataSource)
        XCTAssertTrue(view.currenciesHomeView.tableView.delegate === view)
        XCTAssertTrue(view.currenciesHomeView.currenciesActionView.delegate === view)
    }
    
    func testWhenLayoutCalled_ThenAddsCurrenciesHomeView() {
        view.layout()
        
        XCTAssertTrue(view.currenciesHomeView.isDescendant(of: view.view))
    }
    
    func testWhenDidTapTopUpButton_ThenViewModelCalled() {
        view.didTapTopUpButton()
        
        XCTAssertTrue(viewModel.didTapTopUpCalled)
    }
    
    func testWhenDidTapBuyOrSellButton_ThenViewModelCalled() {
        view.didTapBuyOrSellButton()
        
        XCTAssertTrue(viewModel.didTapBuyOrSellCalled)
    }
    
    func testWhenDidTapGlintItButton_ThenViewModelCalled() {
        view.didTapGlintItButton()
        
        XCTAssertTrue(viewModel.didTapGlintItCalled)
    }
    
    func testWhenDidSelectRow_ThenCallsViewModel() {
        let indexPath = IndexPath(row: .zero, section: .zero)
        view.currenciesHomeView.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        view.currenciesHomeView.tableView.delegate?.tableView?(view.currenciesHomeView.tableView, didSelectRowAt: indexPath)
        view.tableView(view.currenciesHomeView.tableView, didSelectRowAt: indexPath)
        
        XCTAssertTrue(viewModel.didTapCurrencyCalled)
    }
}
