//
//  ProfilePresenter.swift
//  RestFood
//
//  Created by Danil on 22.02.2024.
//

import Foundation
protocol ProfilePresenterProtocol {
    
}
class ProfilePresenter {
    weak var view: ProfileViewControllerProtocol?
    var model: ProfileModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: ProfileViewControllerProtocol?, model: ProfileModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension ProfilePresenter: ProfilePresenterProtocol {
    
}
