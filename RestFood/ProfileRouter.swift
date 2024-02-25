//
//  ProfileRouter.swift
//  RestFood
//
//  Created by Danil on 23.02.2024.
//

import UIKit

protocol ProfileRoute {
    func openProfile() -> UIViewController
}

extension ProfileRoute where Self: Router {
    
    func openProfile() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = ProfileViewController()
        let model = ProfileModel()
        let presenter = ProfilePresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.topViewController?.title = "title"
        navigation.setNavigationBarHidden(true, animated: false)
        return navigation
    }
    
    func selectListTab() {
        root?.tabBarController?.selectedIndex = 0
    }
}

extension DefaultRouter: ProfileRoute {}
