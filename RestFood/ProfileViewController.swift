//
//  ProfileViewController.swift
//  RestFood
//
//  Created by Danil on 22.02.2024.
//

import UIKit
protocol ProfileViewControllerProtocol: AnyObject {
    
}
class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterProtocol!
    lazy var avatarRect: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = view.frame.width/2
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(avatarRect)
    }
    
    func setupConstraints() {
        avatarRect.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(219)
        }
    }
}
extension ProfileViewController: ProfileViewControllerProtocol {
    
}
