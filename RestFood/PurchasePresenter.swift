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
    func openPaymentMethod()
    func close()
}
class PurchasePresenter {
    weak var view: PurchaseViewControllerProtocol?
    //var KeychainCardService: KeychainCardService!
    var model: PurchaseModel! //Добавить сохранение туда карточек и там же делать их добавление в keychain
    let router: Routes
    typealias Routes = Closable & ScannerRoute & TransactionStatusRoute & PaymentMethodRoute
    required init(router: Routes, view: PurchaseViewControllerProtocol?, model: PurchaseModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension PurchasePresenter: PurchasePresenterProtocol {
    func openPaymentMethod() {
        router.openPaymentMethod()
    }
    
    func close() {
        router.close()
    }
    
    func openTransaction() {
        router.openTransactionStatus()
    }
    
    func openScanner() {
        router.openScanner()
    }
    
    
    
    
}
