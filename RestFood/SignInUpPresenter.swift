//
//  SignInUpPresenter.swift
//  RestFood
//
//  Created by Danil on 30.01.2024.
//

import Foundation

protocol SignInUpPresenterProtocol: AnyObject {
    func openMain()
    func openOnboarding()
}

class SignInUpPresenter {
    
    weak var view: SignInUpViewControllerProtocol?
    var model: SignInUpModel!
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter & OnBoardingRoute
    required init(router: Routes, view: SignInUpViewControllerProtocol?, model: SignInUpModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}

extension SignInUpPresenter: SignInUpPresenterProtocol {
    func openMain() {
        router.openCustomTabBar()
    }
    func openOnboarding() {
        router.openOnBoarding()
    }
}
