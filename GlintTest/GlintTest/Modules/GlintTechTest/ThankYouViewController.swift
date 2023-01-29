//
//  ThankYouViewController.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import SnapKit
import UIKit

class ThankYouViewController: UIViewController {
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
        titleLabel.font = Theme.Font.heading
        titleLabel.text = L10n.dThankYouDescription
        return titleLabel
    }()
    
    // MARK: - Computed Properties
    
    private var isModal: Bool {
        presentingViewController != nil
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        view.backgroundColor = Asset.Colors.glintGreenDark.color
        navigationItem.title = L10n.dThankYouTitle
        if isModal { setupCloseButton() }
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(Theme.Spacing.large)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: - CloseProtocol

extension ThankYouViewController: CloseProtocol {
    func didTapCloseButton() {
        dismiss(animated: true)
    }
}
