//
//  TabBarController.swift
//  RestFood
//
//  Created by Danil on 22.02.2024.
//

import UIKit

protocol CustomTabBarProtocol: AnyObject {
}

class CustomTabBar: UITabBarController {
    var tabs = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        setupViews()
    }
    func setupViews() {
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: -3.0)
        tabBar.layer.shadowOpacity = 5
        tabBar.layer.shadowRadius = 3
        tabBar.layer.masksToBounds = false
        tabBar.layer.cornerRadius = 4.0
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
extension CustomTabBar: CustomTabBarProtocol {
}
