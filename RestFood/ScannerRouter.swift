//
//  ScannerRouter.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import Foundation

protocol ScannerRoute {
    func openScanner()
}

extension ScannerRoute where Self: Router {
    func openScanner(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = ScannerViewController()
        let model = ScannerModel()
        let presenter = ScannerPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openScanner() {
        openScanner(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: ScannerRoute {}
