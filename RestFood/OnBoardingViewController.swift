//
//  File.swift
//  RestFood
//
//  Created by Danil on 06.03.2024.
//

import UIKit
protocol OnBoardingViewControllerProtocol: AnyObject {
    
}
class OnBoardingViewController: UIViewController {
    var presenter: OnBoardingPresenterProtocol!
    var isShowAll = false
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.isScrollEnabled = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .magenta
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.buttonAnimate()
        return button
    }()
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startScreen")!)
        self.presenter.createSlides()
        setupSlidesScrollView(slides: presenter.slides)
        scrollView.delegate = self
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(600)
        }
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(-150)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(50)
        }
        nextButton.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(-100)
            make.height.equalTo(30)
        }
    }
    
    func setupSlidesScrollView(slides: [OnBoardingView]) {
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    @objc func nextPage() {
        if isShowAll == true {
            presenter.openLogin()
        }
        if scrollView.contentOffset.x < self.view.bounds.width * CGFloat(presenter.slides.count - 1) {
            UIView.animate(withDuration: 0.2) {
                self.scrollView.contentOffset.x += self.view.bounds.width
            }
            if isShowAll == false {
                if scrollView.contentOffset.x / view.frame.width == 2.0 {
                    let userDefaults = UserDefaults.standard
                    userDefaults.integer(forKey: "WhichScreenShowNext")
                    userDefaults.set(1, forKey: "WhichScreenShowNext")
                    isShowAll = true
                }
            }
        }
    }
    
}
extension OnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
extension OnBoardingViewController: OnBoardingViewControllerProtocol {
    
}
