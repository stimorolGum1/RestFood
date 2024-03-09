//
//  TabBarRouter.swift
//  RestFood
//
//  Created by Danil on 22.02.2024.
//

import UIKit

protocol CustomTabBarRouter {
    func openCustomTabBar()
}

extension CustomTabBarRouter where Self: Router {
    func openCustomTabBar(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let tabs = [router.openMain()]
        let tabbar = CustomTabBar()
        tabbar.viewControllers = tabs
        router.root = tabbar
        route(to: tabbar, as: transition)
    }

    func openTabBarStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let tabbar = CustomTabBar()
        tabbar.viewControllers = [
            generateVC(
                viewController: router.openMain(),
                title: "",
                image: UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
            ),
            generateVC(
                viewController: router.openProfile(),
                title: "",
                image: UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal)
            ),
            generateVC(viewController: router.openOrder(),
                title: "",
                image: UIImage(named: "order")?.withRenderingMode(.alwaysOriginal)
                      )
        ]
        router.root = tabbar
        return tabbar
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }

    func openCustomTabBar() {
        openCustomTabBar(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: CustomTabBarRouter {}
