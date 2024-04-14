//
//  EditUserRouter.swift
//  RestFood
//
//  Created by Danil on 28.03.2024.
//

import Foundation
protocol EditUserRoute {
    func openEditUser()
}

extension EditUserRoute where Self: Router {
    func openEditUser(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = EditUserViewController()
        let model = EditUserModel()
        let presenter = EditUserPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openEditUser() {
        openEditUser(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: EditUserRoute {}
