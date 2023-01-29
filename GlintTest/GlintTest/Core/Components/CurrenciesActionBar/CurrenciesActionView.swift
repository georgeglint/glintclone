//
//  CurrenciesButtonView.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import SnapKit
import UIKit

// MARK: - CurrenciesActionViewDelegate

protocol CurrenciesActionViewDelegate: AnyObject {
    func didTapTopUpButton()
    func didTapBuyOrSellButton()
    func didTapGlintItButton()
}

// MARK: - CurrenciesActionView

class CurrenciesActionView: UIView {
    // MARK: - UI Elements
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = Theme.Spacing.extraLarge
        return stackView
    }()
    
    private lazy var topUpButton: CurrenciesButton = {
        let topUpButton = CurrenciesButton(with: Asset.Images.plus.image, title: L10n.aTopUp)
        topUpButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapTopUpButton)))
        return topUpButton
    }()
    
    private lazy var buyOrSellButton: CurrenciesButton = {
        let buyOrSellButton = CurrenciesButton(with: Asset.Images.buyOrSell.image, title: L10n.aBuyOrSell)
        buyOrSellButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBuyOrSellButton)))
        return buyOrSellButton
    }()
    
    private lazy var glintItButton: CurrenciesButton = {
        let glintItButton = CurrenciesButton(with: Asset.Images.glintIt.image, title: L10n.aGlintIt)
        glintItButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBuyOrSellButton)))
        return glintItButton
    }()
    
    // MARK: - Properties
    
    weak var delegate: CurrenciesActionViewDelegate?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        addSubview(stackView)
        [topUpButton, buyOrSellButton, glintItButton].forEach { stackView.addArrangedSubview($0) }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Theme.Spacing.extraSmall)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func didTapTopUpButton() {
        delegate?.didTapTopUpButton()
    }
    
    @objc private func didTapBuyOrSellButton() {
        delegate?.didTapBuyOrSellButton()
    }
    
    @objc private func didTapGlintItButton() {
        delegate?.didTapGlintItButton()
    }
}
