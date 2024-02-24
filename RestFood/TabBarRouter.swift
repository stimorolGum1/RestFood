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
        let tabs = [router.openMain(), router.openProfile()]
        let tabbar = CustomTabBar()
        tabbar.viewControllers = tabs
        router.root = tabbar
        return tabbar
    }

    func openCustomTabBar() {
        openCustomTabBar(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: CustomTabBarRouter {}
