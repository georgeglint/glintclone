//
//  CurrenciesButton.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import SnapKit
import UIKit

class CurrenciesButton: UIView {
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = Theme.Font.body
        return titleLabel
    }()
    
    // MARK: - Lifecycle
    
    required init(with image: UIImage, title: String) {
        super.init(frame: .zero)
        imageView.image = image
        titleLabel.text = title
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        [imageView, titleLabel].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(Constants.imageViewSize)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(Theme.Spacing.small)
            $0.left.bottom.right.equalToSuperview()
        }
    }
}

// MARK: - Constants

extension CurrenciesButton {
    private struct Constants {
        static let imageViewSize: CGFloat = 25
    }
}
