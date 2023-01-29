//
//  SceneDelegate.swift
//  GlintTest
//
//  Created by George Leadbeater on 23/01/2023.
//

import UIKit

class SceneDelegate: UIResponder {
    // MARK: - Properties
    
    var appCoordinator: AppCoordinatorProtocol?
    var window: UIWindow?
}

// MARK: - UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}
