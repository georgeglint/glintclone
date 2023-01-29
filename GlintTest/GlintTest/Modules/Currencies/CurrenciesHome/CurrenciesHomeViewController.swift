//
//  CurrenciesHomeViewController.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//
// View: Receives instructions from the ViewModel to display content and relays user input back to the ViewModel.

import SnapKit
import UIKit

class CurrenciesHomeViewController: UIViewController {
    // MARK: - CurrenciesHomeViewProtocol
    
    var viewModel: CurrenciesHomeViewModelProtocol?
    
    // MARK: - UI Elements
    
    lazy var notificationButtonItem = UIBarButtonItem(image: Asset.Images.notificationBell.image,
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(didTapNotificationButton))
    
    let currenciesHomeView = CurrenciesHomeView()
    
    // MARK: - Properties
    
    lazy var dataSource =
    UITableViewDiffableDataSource<Int, CurrenciesCellType>(tableView: currenciesHomeView.tableView) { tableView, indexPath, cellType in
        switch cellType {
        case .verify:
            return tableView.dequeue(VerifyCell.self, indexPath: indexPath)
        case .currency(let currency):
            let cell = tableView.dequeue(CurrencyCell.self, indexPath: indexPath)
            cell.configure(with: currency)
            return cell
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    @objc func didTapNotificationButton() {
        viewModel?.didTapViewNotifications()
    }
}

// MARK: - CurrenciesHomeViewProtocol

extension CurrenciesHomeViewController: CurrenciesHomeViewProtocol {
    func setup() {
        view.backgroundColor = Asset.Colors.glintGreenDark.color
        title = L10n.dCurrencies
        navigationItem.rightBarButtonItem = notificationButtonItem
        currenciesHomeView.tableView.dataSource = dataSource
        currenciesHomeView.tableView.delegate = self
        currenciesHomeView.currenciesActionView.delegate = self
    }
    
    func layout() {
        view.addSubview(currenciesHomeView)
        
        currenciesHomeView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func update(with cellTypes: [CurrenciesCellType]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CurrenciesCellType>()
        snapshot.appendSections([.zero])
        snapshot.appendItems(cellTypes, toSection: .zero)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - CurrenciesButtonViewDelegate

extension CurrenciesHomeViewController: CurrenciesActionViewDelegate {
    func didTapTopUpButton() {
        viewModel?.didTapTopUp()
    }
    
    func didTapBuyOrSellButton() {
        viewModel?.didTapBuyOrSell()
    }
    
    func didTapGlintItButton() {
        viewModel?.didTapGlintIt()
    }
}

// MARK: - UITableViewDelegate

extension CurrenciesHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didTapCurrency(at: indexPath)
    }
}
