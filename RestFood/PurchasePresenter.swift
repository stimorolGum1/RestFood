//
//  PurchasePresenter.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import Foundation
protocol PurchasePresenterProtocol {

}
class PurchasePresenter {
    weak var view: PurchaseViewControllerProtocol?
    var model: PurchaseModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: PurchaseViewControllerProtocol?, model: PurchaseModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension PurchasePresenter: PurchasePresenterProtocol {

}
