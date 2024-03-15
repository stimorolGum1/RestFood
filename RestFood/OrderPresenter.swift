//
//  OrderPresenter.swift
//  RestFood
//
//  Created by Danil on 09.03.2024.
//

import Foundation
protocol OrderPresenterProtocol {
    func openPurchase()
    
}
class OrderPresenter {
    weak var view: OrderViewControllerProtocol?
    var model: OrderModel!
    let router: Routes
    typealias Routes = Closable & PurchaseRoute
    required init(router: Routes, view: OrderViewControllerProtocol?, model: OrderModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}
extension OrderPresenter: OrderPresenterProtocol {
    func openPurchase() {
        router.openPurchase()
    }
}
