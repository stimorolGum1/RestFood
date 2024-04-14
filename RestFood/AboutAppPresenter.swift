//
//  FAQPresenter.swift
//  RestFood
//
//  Created by Danil on 09.04.2024.
//

import Foundation
protocol AboutAppPresenterProtocol {
    func close()
}
class AboutAppPresenter {
    weak var view: AboutAppViewControllerProtocol?
    var model: AboutAppModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: AboutAppViewControllerProtocol?, model: AboutAppModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension AboutAppPresenter: AboutAppPresenterProtocol {
    func close() {
        router.close()
    }
    
    
}
