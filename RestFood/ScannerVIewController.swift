//
//  ScannerVIewController.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import Foundation
import UIKit
protocol ScannerViewControllerProtocol: AnyObject {
    
}
class ScannerViewController: UIViewController {
    var presenter: ScannerPresenterProtocol!
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
    }
    
    func setupConstraints() {
    }
}
extension ScannerViewController: ScannerViewControllerProtocol {
    
}
