//
//  TransactionStatusRouter.swift
//  RestFood
//
//  Created by Danil on 18.03.2024.
//

import Foundation

protocol TransactionStatusRoute {
    func openTransactionStatus()
}

extension StartScreenRoute where Self: Router {
    func openTransactionStatus(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = TransactionStatusViewController()
        let model = TransactionStatusModel()
        let presenter = TransactionStatusPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openTransactionStatus() {
        openTransactionStatus(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: TransactionStatusRoute {}
