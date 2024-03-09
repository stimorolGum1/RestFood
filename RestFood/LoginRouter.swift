//
//  LoginRoute.swift
//  YaDisk
//
//  Created by Danil on 23.07.2023.
//

import UIKit

protocol LoginRoute {
    func openLogin()
    func openLoginAsStartScreen() -> UIViewController
}

extension LoginRoute where Self: Router {
    func openLogin(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = LoginViewController()
        let model = LoginModel()
        let presenter = LoginPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openLoginAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = LoginViewController()
        let model = LoginModel()
        let presenter = LoginPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
        return viewController
    }
    func openLogin() {
        openLogin(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: LoginRoute {}
