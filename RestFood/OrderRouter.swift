//
//  OrderRouter.swift
//  RestFood
//
//  Created by Danil on 09.03.2024.
//

import UIKit

protocol OrderRoute {
    func openOrder() -> UIViewController
}

extension OrderRoute where Self: Router {
    
    func openOrder() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = OrderViewController()
        let model = OrderModel()
        let presenter = OrderPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        return viewController
    }
}

extension DefaultRouter: OrderRoute {}
