//
//  CurrenciesHomeView.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import SnapKit
import UIKit

class CurrenciesHomeView: UIView {
    // MARK: - UI Elements
    
    let currenciesActionView = CurrenciesActionView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset.bottom = Theme.Spacing.small
        [CurrencyCell.self, VerifyCell.self].forEach { tableView.register($0) }
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        [currenciesActionView, tableView].forEach { addSubview($0) }
        
        currenciesActionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.small)
            $0.left.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(currenciesActionView.snp.bottom).offset(Theme.Spacing.small)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}

// MARK: - Constants

extension CurrenciesHomeView {
    private struct Constants {
        static let estimatedRowHeight: CGFloat = 50
    }
}
