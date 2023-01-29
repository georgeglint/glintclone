//
//  TabBarController.swift
//  GlintTest
//
//  Created by George Leadbeater on 24/01/2023.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Enums
    
    enum ContentType: String, CaseIterable {
        case currencies
        case markets
        case card
        case profile
        case help
        
        var title: String {
            switch self {
            case .currencies: return L10n.aCurrencies
            case .markets: return L10n.aMarkets
            case .card: return L10n.aCard
            case .profile: return L10n.aProfile
            case .help: return L10n.aHelp
            }
        }
        
        var image: UIImage? {
            switch self {
            case .currencies: return Asset.Images.tabCurrencies.image
            case .markets: return Asset.Images.tabMarkets.image
            case .card: return Asset.Images.tabCard.image
            case .profile: return Asset.Images.tabProfile.image
            case .help: return Asset.Images.tabHelp.image
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        tabBar.barTintColor = .white
        tabBar.backgroundColor = Asset.Colors.glintGreen.color
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = Asset.Colors.glintGray.color
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()

        viewControllers = ContentType
            .allCases
            .enumerated()
            .map {
                child(of: $1, with: $0)
                .embedInNavigationController() as NavigationController
            }
    }
    
    private func child(of type: ContentType, with index: Int) -> UIViewController {
        let viewController = buildModule(for: type)
        viewController.tabBarItem = tabBarItem(for: type, index: index)
        return viewController
    }
    
    private func buildModule(for type: ContentType) -> UIViewController {
        switch type {
        case .currencies: return CurrenciesHomeModule.build()
        default: return ThankYouViewController()
        }
    }
    
    private func tabBarItem(for type: ContentType, index: Int) -> UITabBarItem {
        let item = UITabBarItem(title: type.title,
                                image: type.image?.withRenderingMode(.alwaysTemplate),
                                tag: index)
        return item
    }
    
    private func index(for contentType: ContentType) -> Int {
        ContentType.allCases.firstIndex(of: contentType) ?? .zero
    }
}
