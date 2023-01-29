//
//  CoordinatorProtocol.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var viewController: UIViewController? { get set }

    func push(_ view: UIViewController)
}

extension CoordinatorProtocol {
    func push(_ view: UIViewController) {
        viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
