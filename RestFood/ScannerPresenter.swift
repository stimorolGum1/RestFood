//
//  ScannerPresenter.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import Foundation
protocol ScannerPresenterProtocol {
    func close()
    func qrDecode(dataOfTable: String, completion: (String?, Error?) -> Void)
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
    func qrDecode(dataOfTable: String, completion: (String?, Error?) -> Void) {
        do {
            let restaurantInfo = try JSONDecoder().decode(ScannerModel.self, from: dataOfTable.data(using: .utf8)!)
            completion(String(restaurantInfo.tableNumber), nil)
        } catch {
            completion(nil, error)
        }
    }
    func close() {
        router.close()
    }
}
