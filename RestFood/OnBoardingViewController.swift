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
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
    }
    
    func setupConstraints() {
    }
}
extension OnBoardingViewController: OnBoardingViewControllerProtocol {
    
}
