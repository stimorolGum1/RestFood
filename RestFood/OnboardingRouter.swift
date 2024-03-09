//
//  OnboardingRouter.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import Foundation
import UIKit
protocol OnBoardingRoute {
    func openOnBoarding()
    func openOnBoardingAsStartScreen() -> UIViewController
}

extension OnBoardingRoute where Self: Router {
    func openOnBoarding(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewController = OnBoardingViewController()
        let model = OnBoardingModel()
        let presenter = OnBoardingPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        route(to: viewController, as: transition)
    }
    
    func openOnBoardingAsStartScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewController = OnBoardingViewController()
        let model = OnBoardingModel()
        let presenter = OnBoardingPresenter(router: router, view: viewController, model: model)
        viewController.presenter = presenter
        router.root = viewController
        return viewController
    }
    
    func openOnBoarding() {
        openOnBoarding(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: OnBoardingRoute {}
