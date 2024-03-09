//
//  OnBoardingPresenter.swift
//  RestFood
//
//  Created by Danil on 06.03.2024.
//

protocol OnBoardingPresenterProtocol {
    func openLogin()
    func createSlides()
    var slides: [OnBoardingView] { get set }
}
class OnBoardingPresenter {
    weak var view: OnBoardingViewControllerProtocol?
    var model: OnBoardingModel!
    var slides = [OnBoardingView]()
    let router: Routes
    typealias Routes = Closable & CustomTabBarRouter
    required init(router: Routes, view: OnBoardingViewControllerProtocol?, model: OnBoardingModel) {
        self.router = router
        self.view = view
        self.model = model
    }
    
}
extension OnBoardingPresenter: OnBoardingPresenterProtocol {
    func openLogin() {
        router.openCustomTabBar()
    }
    func createSlides() {
        model?.createSlides()
        slides = model!.slides
    }
}
