//
//  MainScreenPresenter.swift
//  RestFood
//
//  Created by Danil on 31.01.2024.
//

import Foundation
protocol MainScreenPresenterProtocol: AnyObject {
    func prepareElem(index: Int) -> String
    func modelCount() -> Int
    func openDetailFood()
}

class MainScreenPresenter {
    
    weak var view: MainScreenViewControllerProtocol?
    var model: MainScreenModel!
    let router: Routes
    typealias Routes = Closable & FoodDetailRoute
    required init(router: Routes, view: MainScreenViewControllerProtocol?, model: MainScreenModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    func prepareElem(index: Int) -> String {
        return model.elem[index]
    }
    func modelCount() -> Int {
        return model.elem.count
    }
    
}
extension MainScreenPresenter: MainScreenPresenterProtocol {
    func openDetailFood() {
        router.openFoodDetail()
    }
    
}
