//
//  MainRouter.swift
//  RestFood
//
//  Created by Danil on 01.02.2024.
//

import UIKit

protocol MainRoute {
    func openMain()
    func openMainAsStartScreen() -> UIViewController
}

extension MainRoute where Self: Router {
    
    func openMain(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = MainScreenViewController()
        let model = foodModel()
        let presenter = MainScreenPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    
    func openMainAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = MainScreenViewController()
        let model = foodModel()
        let presenter = MainScreenPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        return viewController
    }
    func openMain() {
        openMain(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: MainRoute {}
