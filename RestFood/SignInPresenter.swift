//
//  SignInPresenter.swift
//  RestFood
//
//  Created by Danil on 30.01.2024.
//

import Foundation

protocol SignInPresenterProtocol: AnyObject {
    func openMain()
    func openOnboarding()
    func openSignUp()
}

class SignInPresenter {
    
    weak var view: SignInViewControllerProtocol?
    var model: SignInModel!
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter & OnBoardingRoute & SignUpRoute
    required init(router: Routes, view: SignInViewControllerProtocol?, model: SignInModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}

extension SignInPresenter: SignInPresenterProtocol {
    func openSignUp() {
        router.openSignUp()
    }
    func openMain() {
        router.openCustomTabBar()
    }
    func openOnboarding() {
        router.openOnBoarding()
    }
}
