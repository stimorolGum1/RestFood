//
//  SignUpRouter.swift
//  RestFood
//
//  Created by Danil on 13.04.2024.
//

import UIKit

protocol SignUpRoute {
    func openSignUp()
}

extension SignUpRoute where Self: Router {
    func openSignUp(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = SignUpViewController()
        let model = SignUpModel()
        let presenter = SignUpPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openSignUp() {
        openSignUp(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: SignUpRoute {}
