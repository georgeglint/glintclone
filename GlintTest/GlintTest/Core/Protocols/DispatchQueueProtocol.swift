//
//  DispatchQueueProtocol.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void)
    func asyncAfter(deadline: DispatchTime, execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }

    func asyncAfter(deadline: DispatchTime, execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: deadline, qos: .unspecified, flags: [], execute: work)
    }
}
