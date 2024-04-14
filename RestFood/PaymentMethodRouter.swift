//
//  PaymentMethodRouter.swift
//  RestFood
//
//  Created by Danil on 04.04.2024.
//

import Foundation
protocol PaymentMethodRoute {
    func openPaymentMethod()
}

extension PaymentMethodRoute where Self: Router {
    func openPaymentMethod(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = PaymentMethodViewController()
        let model = PaymentMethodModel()
        let presenter = PaymentMethodPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openPaymentMethod() {
        openPaymentMethod(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: PaymentMethodRoute {}
