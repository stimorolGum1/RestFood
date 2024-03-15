//
//  PurchaseRouter.swift
//  RestFood
//
//  Created by Danil on 11.03.2024.
//

import Foundation

protocol PurchaseRoute {
    func openPurchase()
}

extension StartScreenRoute where Self: Router {
    func openPurchase(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = PurchaseViewController()
        let model = PurchaseModel()
        let presenter = PurchasePresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openPurchase() {
        openPurchase(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: PurchaseRoute {}
