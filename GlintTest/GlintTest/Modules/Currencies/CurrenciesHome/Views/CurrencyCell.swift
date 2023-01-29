//
//  CurrencyCell.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import SnapKit
import UIKit

class CurrencyCell: UITableViewCell {
    // MARK: - UI Elements
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = Asset.Colors.glintGreen.color
        return containerView
    }()
    
    private let currencyCodeLabel: UILabel = {
        let currencyCodeLabel = UILabel()
        currencyCodeLabel.textAlignment = .left
        currencyCodeLabel.font = Theme.Font.extraLargeHeading
        return currencyCodeLabel
    }()
    
    private let currencyValueLabel: UILabel = {
        let currencyValueLabel = UILabel()
        currencyValueLabel.textAlignment = .right
        currencyValueLabel.font = Theme.Font.heading
        return currencyValueLabel
    }()
    
    private let currencyConversionLabel: UILabel = {
        let currencyConversionLabel = UILabel()
        currencyConversionLabel.textAlignment = .right
        currencyConversionLabel.font = Theme.Font.subheading
        return currencyConversionLabel
    }()
    
    private let conversionImageView: UIImageView = {
        let conversionImageView = UIImageView()
        conversionImageView.contentMode = .scaleAspectFit
        conversionImageView.image = Asset.Images.indicator.image
        return conversionImageView
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currencyConversionLabel.isHidden = false
        conversionImageView.isHidden = false
    }
    
    // MARK: - Public Methods
    
    func configure(with currency: Currency) {
        currencyCodeLabel.text = currency.code
        currencyValueLabel.text = currency.value
        currencyCodeLabel.textColor = currency.highlighted ? Asset.Colors.glintGold.color : .white
        conversionImageView.tintColor = currency.highlighted ? Asset.Colors.glintGold.color : Asset.Colors.glintLime.color
        
        if let conversionValue = currency.conversionValue {
            currencyConversionLabel.text = conversionValue
        } else {
            currencyConversionLabel.isHidden = true
            conversionImageView.isHidden = true
        }
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(containerView)
        [currencyCodeLabel, currencyValueLabel, currencyConversionLabel, conversionImageView].forEach { containerView.addSubview($0) }
        
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.small)
            $0.left.bottom.right.equalToSuperview()
        }
        
        currencyCodeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.mediumLarge)
            $0.left.equalToSuperview().inset(Theme.Spacing.medium)
            $0.bottom.equalToSuperview().inset(Theme.Spacing.extraLarge)
        }
        
        currencyValueLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.large)
            $0.right.equalToSuperview().inset(Theme.Spacing.medium)
        }
        
        currencyConversionLabel.snp.makeConstraints {
            $0.top.equalTo(currencyValueLabel.snp.bottom).offset(Theme.Spacing.extraSmall)
            $0.right.equalTo(currencyValueLabel.snp.right)
        }
        
        conversionImageView.snp.makeConstraints {
            $0.right.equalTo(currencyConversionLabel.snp.left)
            $0.centerY.equalTo(currencyConversionLabel.snp.centerY)
            $0.size.equalTo(Constants.conversionImageSize)
        }
    }
}

// MARK: - Constants

extension CurrencyCell {
    private struct Constants {
        static let conversionImageSize: CGFloat = 15
    }
}
