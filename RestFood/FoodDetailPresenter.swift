//
//  FoodDetailPresenter.swift
//  RestFood
//
//  Created by Danil on 05.02.2024.
//

import Foundation
protocol FoodDetailPresenterProtocol: AnyObject {
    func foodIncrement()
    func foodDecriment()
    func addToCart()
}

class FoodDetailPresenter {
    
    weak var view: FoodDetailViewControllerProtocol?
    var model: FoodDetailModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: FoodDetailViewControllerProtocol?, model: FoodDetailModel) {
        self.router = router
        self.view = view
        self.model = model
    }
}
extension FoodDetailPresenter: FoodDetailPresenterProtocol {
    func addToCart() {
        print("added to cart \(model.countOfFood)")
    }
    
    func foodCount() {
        view?.updateFoodCount(count: model.countOfFood)
    }
    
    func foodIncrement() {
        model.countOfFood += 1
        foodCount()
    }
    
    func foodDecriment() {
        if model.countOfFood > 1 {
            model.countOfFood -= 1
            foodCount()
        }
    }
}
