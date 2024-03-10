//
//  LoginPresenter.swift
//  RestFood
//
//  Created by Danil on 30.01.2024.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func openMain()
    func openOnboarding()
}

class LoginPresenter {
    
    weak var view: LoginViewControllerProtocol?
    var model: LoginModel!
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter & OnBoardingRoute
    required init(router: Routes, view: LoginViewControllerProtocol?, model: LoginModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func openMain() {
        router.openCustomTabBar()
    }
    func openOnboarding() {
        router.openOnBoarding()
    }
}
