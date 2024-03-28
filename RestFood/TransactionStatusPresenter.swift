//
//  TransactionStatusPresenter.swift
//  RestFood
//
//  Created by Danil on 18.03.2024.
//

import Foundation
protocol TransactionStatusPresenterProtocol {
    func closeTransaction()
}
class TransactionStatusPresenter {
    weak var view: TransactionStatusViewControllerProtocol?
    var model: TransactionStatusModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: TransactionStatusViewControllerProtocol?, model: TransactionStatusModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension TransactionStatusPresenter: TransactionStatusPresenterProtocol {
    func closeTransaction() {
        router.close()
    }
    
    
}
