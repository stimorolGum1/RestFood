//
//  PaymentMethodPresenter.swift
//  RestFood
//
//  Created by Danil on 04.04.2024.
//

import Foundation
protocol PaymentMethodPresenterProtocol {
    func close()
}
class PaymentMethodPresenter {
    weak var view: PaymentMethodViewControllerProtocol?
    var model: PaymentMethodModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: PaymentMethodViewControllerProtocol?, model: PaymentMethodModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension PaymentMethodPresenter: PaymentMethodPresenterProtocol {
    func close() {
        router.close()
    }
    
    
}
