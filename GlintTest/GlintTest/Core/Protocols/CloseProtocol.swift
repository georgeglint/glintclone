//
//  CloseProtocol.swift
//  GlintTest
//
//  Created by George Leadbeater on 25/01/2023.
//

import UIKit

@objc protocol CloseProtocol {
    var navigationItem: UINavigationItem { get }

    func didTapCloseButton()
}

extension CloseProtocol {
    func setupCloseButton() {
        let closeButton = UIBarButtonItem(image: Asset.Images.close.image,
                                          style: .plain,
                                          target: self,
                                          action: #selector(didTapCloseButton))
        navigationItem.rightBarButtonItem = closeButton
    }
}
