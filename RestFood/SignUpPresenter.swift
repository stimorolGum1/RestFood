//
//  SignUpPresenter.swift
//  RestFood
//
//  Created by Danil on 13.04.2024.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    func openMain()
    func openOnboarding()
    func openLogin()
    func checkLogin(login: String) -> Bool
    func checkPass(pass: String) -> Bool
    func auth(login: String, pass: String)
}

class SignUpPresenter {
    
    weak var view: SignUpViewControllerProtocol?
    var model: SignUpModel!
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter & OnBoardingRoute & SignInRoute
    required init(router: Routes, view: SignUpViewControllerProtocol?, model: SignUpModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}

extension SignUpPresenter: SignUpPresenterProtocol {
    func auth(login: String, pass: String) {
    }
    
    
    func checkPass(pass: String) -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: pass)
    }
    
    func checkLogin(login: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: login)
    }
    func openMain() {
        router.openCustomTabBar()
    }
    func openOnboarding() {
        router.openOnBoarding()
    }
    func openLogin() {
        router.openSignInUp()
    }
    
}
