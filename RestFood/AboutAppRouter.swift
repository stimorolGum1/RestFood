//
//  FAQRouter.swift
//  RestFood
//
//  Created by Danil on 09.04.2024.
//

import Foundation
protocol AboutAppRoute {
    func openAboutApp()
}

extension AboutAppRoute where Self: Router {
    func openAboutApp(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = AboutAppViewController()
        let model = AboutAppModel()
        let presenter = AboutAppPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openAboutApp() {
        openAboutApp(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: AboutAppRoute {}
