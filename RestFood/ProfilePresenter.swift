//
//  ProfilePresenter.swift
//  RestFood
//
//  Created by Danil on 22.02.2024.
//

import Foundation
protocol ProfilePresenterProtocol {
    func close()
    func openEditUser()
    func openAboutApp()
    func openLogin()
}
class ProfilePresenter {
    weak var view: ProfileViewControllerProtocol?
    var model: ProfileModel!
    let router: Routes
    typealias Routes = Closable & EditUserRoute & AboutAppRoute & SignInRoute
    required init(router: Routes, view: ProfileViewControllerProtocol?, model: ProfileModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension ProfilePresenter: ProfilePresenterProtocol {
    func openAboutApp() {
        router.openAboutApp()
    }
    
    func close() {
        router.close()
    }
    
    func openEditUser() {
        router.openEditUser()
    }
    func openLogin() {
        router.openSignInUp()
    }
    
}
