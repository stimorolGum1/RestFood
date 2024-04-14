//
//  EditUserPresenter.swift
//  RestFood
//
//  Created by Danil on 28.03.2024.
//

import Foundation
protocol EditUserPresenterProtocol {
    func close()
}
class EditUserPresenter {
    weak var view: EditUserViewControllerProtocol?
    var model: EditUserModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: EditUserViewControllerProtocol?, model: EditUserModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension EditUserPresenter: EditUserPresenterProtocol {
    func close() {
        router.close()
    }
    
    
}
