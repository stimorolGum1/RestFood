//
//  FoodDetailRouter.swift
//  RestFood
//
//  Created by Danil on 05.02.2024.
//

import Foundation
import UIKit
protocol FoodDetailRoute {
    func openFoodDetail()
}

extension FoodDetailRoute where Self: Router {
    func openFoodDetail(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = FoodDetailViewController()
        let model = FoodDetailModel()
        let presenter = FoodDetailPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    func openFoodDetail() {
        openFoodDetail(with: ModalTransition())
    }
}

extension DefaultRouter: FoodDetailRoute {}
