//
//  LoginPresenter.swift
//  RestFood
//
//  Created by Danil on 30.01.2024.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    
}

class LoginPresenter {
    
    weak var view: LoginViewControllerProtocol?
    var model: LoginModel!
    let router: Routes
    typealias Routes = Closable & MainRoute
    required init(router: Routes, view: LoginViewControllerProtocol?, model: LoginModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
    func openMain() {
        router.openMain()
    }
    
}

extension LoginPresenter: LoginPresenterProtocol {
    
}
