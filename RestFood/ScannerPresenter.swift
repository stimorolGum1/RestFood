//
//  ScannerPresenter.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import Foundation
protocol ScannerPresenterProtocol {
    func close()
}
class ScannerPresenter {
    weak var view: ScannerViewControllerProtocol?
    var model: ScannerModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: ScannerViewControllerProtocol?, model: ScannerModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension ScannerPresenter: ScannerPresenterProtocol {
    func close() {
        router.close()
    }
    
    
}
