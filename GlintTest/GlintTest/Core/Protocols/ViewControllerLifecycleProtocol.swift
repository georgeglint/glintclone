//
//  ViewControllerLifecycleProtocol.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

protocol ViewControllerLifecycleProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()
    func viewWillAppear()
    func viewWillDisappear()
}

extension ViewControllerLifecycleProtocol {
    func viewDidLoad() { }
    func viewDidAppear() { }
    func viewDidDisappear() { }
    func viewWillAppear() { }
    func viewWillDisappear() { }
}
