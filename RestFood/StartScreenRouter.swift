//
//  StartScreenRouter.swift
//  RestFood
//
//  Created by Danil on 07.03.2024.
//

import UIKit

protocol StartScreenRoute {
    func openStartScreen()
    func StartScreenAsStartScreen() -> UIViewController
}

extension StartScreenRoute where Self: Router {
    func openStartScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = StartScreenViewController()
        let model = StartScreenModel()
        let presenter = StartScreenPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func StartScreenAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = StartScreenViewController()
        let model = StartScreenModel()
        let presenter = StartScreenPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
        return viewController
    }
    func openStartScreen() {
        openStartScreen(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: StartScreenRoute {}
