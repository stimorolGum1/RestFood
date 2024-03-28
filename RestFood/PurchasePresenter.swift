//
//  PurchasePresenter.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import Foundation
protocol PurchasePresenterProtocol {
    func openScanner()
    func openTransaction()
}
class PurchasePresenter {
    weak var view: PurchaseViewControllerProtocol?
    var model: PurchaseModel!
    let router: Routes
    typealias Routes = Closable & ScannerRoute & TransactionStatusRoute
    required init(router: Routes, view: PurchaseViewControllerProtocol?, model: PurchaseModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension PurchasePresenter: PurchasePresenterProtocol {
    func openTransaction() {
        router.openTransactionStatus()
    }
    
    func openScanner() {
        router.openScanner()
    }
    
    
}
