//
//  SignInUpRoute.swift
//  YaDisk
//
//  Created by Danil on 23.07.2023.
//

import UIKit

protocol SignInUpRoute {
    func openSignInUp()
    func openSignInUpAsStartScreen() -> UIViewController
}

extension SignInUpRoute where Self: Router {
    func openSignInUp(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = SignInUpViewController()
        let model = SignInUpModel()
        let presenter = SignInUpPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openSignInUpAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = SignInUpViewController()
        let model = SignInUpModel()
        let presenter = SignInUpPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
        return viewController
    }
    func openSignInUp() {
        openSignInUp(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: SignInUpRoute {}
