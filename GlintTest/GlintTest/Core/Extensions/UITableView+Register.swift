//
//  UITableView+Register.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

extension UITableView {
    func register<C>(_ cellClass: C.Type) where C: UITableViewCell {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    func dequeue<C>(_ cellClass: C.Type, indexPath: IndexPath) -> C where C: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.identifier,
                                             for: indexPath) as? C else { return C() }
        return cell
    }
    
    func dequeueHeaderFooterView<V>(_ viewClass: V.Type) -> V where V: UITableViewHeaderFooterView {
        dequeueReusableHeaderFooterView(withIdentifier: viewClass.identifier) as? V ?? V()
    }
}
