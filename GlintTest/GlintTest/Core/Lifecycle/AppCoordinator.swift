//
//  AppCoordinator.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

// MARK: - AppCoordinatorProtocol

protocol AppCoordinatorProtocol {
    func start()
}

// MARK: - AppCoordinator

class AppCoordinator {
    // MARK: - Properties

    var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    private let window: UIWindow

    // MARK: - Lifecycle

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Private Methods

    private func setRootViewController(_ viewController: UIViewController) {
        let snapshotView = UIScreen.main.snapshotView(afterScreenUpdates: false)
        viewController.view.addSubview(snapshotView)

        dispatchQueue.async { [weak window] in
            window?.rootViewController = viewController

            UIView.transition(with: viewController.view,
                              duration: Constants.animationDuration,
                              options: .transitionCrossDissolve,
                              animations: {
                snapshotView.alpha = .zero
            }, completion: { _ in
                snapshotView.removeFromSuperview()
            })
        }
    }
}

// MARK: - AppCoordinatorProtocol

extension AppCoordinator: AppCoordinatorProtocol {
    func start() {
        let storyboard = UIStoryboard(name: Constants.launchScreenStoryboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: Constants.launchScreenViewControllerID)
        window.rootViewController = viewController
        
        dispatchQueue.asyncAfter(deadline: Constants.displayDelay) {
            self.setRootViewController(TabBarController())
        }
    }
}

// MARK: - Constants

extension AppCoordinator {
    private struct Constants {
        static let launchScreenStoryboardName: String = "LaunchScreen"
        static let launchScreenViewControllerID: String = "LaunchScreen"
        static let displayDelay: DispatchTime = .now() + 2
        static let animationDuration: TimeInterval = 0.3
    }
}
