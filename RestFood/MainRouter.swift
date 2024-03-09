//
//  MainRouter.swift
//  RestFood
//
//  Created by Danil on 01.02.2024.
//

import UIKit

protocol MainRoute {
    func openMain() -> UIViewController
}

extension MainRoute where Self: Router {
    
    func openMain() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = MainScreenViewController()
        let model = foodModel()
        let presenter = MainScreenPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        return viewController
    }
}

extension DefaultRouter: MainRoute {}
