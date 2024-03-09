//
//  StartScreenPresenter.swift
//  RestFood
//
//  Created by Danil on 07.03.2024.
//

import Foundation
protocol StartScreenPresenterProtocol {
    
}
class StartScreenPresenter {
    weak var view: StartScreenViewControllerProtocol?
    var model: StartScreenModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: StartScreenViewControllerProtocol?, model: StartScreenModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension StartScreenPresenter: StartScreenPresenterProtocol {
    
}
