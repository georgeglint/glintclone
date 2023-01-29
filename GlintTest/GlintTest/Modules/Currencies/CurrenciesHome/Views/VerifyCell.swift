//
//  VerifyCell.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import SnapKit
import UIKit

class VerifyCell: UITableViewCell {
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = Theme.Font.heading
        titleLabel.text = L10n.dVerifyIdTitle
        return titleLabel
    }()
    
    private let subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = .zero
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = .black
        subtitleLabel.font = Theme.Font.subheading
        subtitleLabel.text = L10n.dVerifyIdDescription
        return subtitleLabel
    }()
    
    private let arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.image = Asset.Images.rightArrow.image
        return arrowImageView
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addBorder(to: .top, color: Asset.Colors.glintGoldDark.color, weight: Theme.Spacing.extraSmall)
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .white
        
        [titleLabel, subtitleLabel, arrowImageView].forEach { contentView.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Theme.Spacing.mediumLarge)
            $0.left.equalToSuperview().inset(Theme.Spacing.medium)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Theme.Spacing.small)
            $0.left.equalToSuperview().inset(Theme.Spacing.medium)
            $0.right.lessThanOrEqualTo(arrowImageView.snp.left).inset(-Theme.Spacing.medium)
            $0.bottom.equalToSuperview().inset(Theme.Spacing.mediumLarge)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(Theme.Spacing.extraSmall)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(Constants.arrowImageViewSize)
        }
    }
}

// MARK: - Constants

extension VerifyCell {
    private struct Constants {
        static let arrowImageViewSize: CGFloat = 20
    }
}
