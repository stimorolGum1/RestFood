//
//  OnBoardingPresenter.swift
//  RestFood
//
//  Created by Danil on 06.03.2024.
//

protocol OnBoardingPresenterProtocol {
    
}
class OnBoardingPresenter {
    weak var view: OnBoardingViewControllerProtocol?
    var model: OnBoardingModel!
    let router: Routes
    typealias Routes = Closable
    required init(router: Routes, view: OnBoardingViewControllerProtocol?, model: OnBoardingModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension OnBoardingPresenter: OnBoardingPresenterProtocol {
    
}
