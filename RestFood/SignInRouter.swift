//
//  SignInRoute.swift
//  YaDisk
//
//  Created by Danil on 23.07.2023.
//

import UIKit

protocol SignInRoute {
    func openSignInUp()
    func openSignInAsStartScreen() -> UIViewController
}

extension SignInRoute where Self: Router {
    func openSignIn(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = SignInViewController()
        let model = SignInModel()
        let presenter = SignInPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openSignInAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = SignInViewController()
        let model = SignInModel()
        let presenter = SignInPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
        return viewController
    }
    func openSignInUp() {
        openSignIn(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: SignInRoute {}
