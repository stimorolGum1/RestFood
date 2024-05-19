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
    lazy var avatarRect: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ava")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Оcтап Бендер"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var editUserButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit User", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 5
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(openEditUser), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var AboutAppButton: UIButton = {
        let button = UIButton()
        button.setTitle("About App", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 5
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(openAboutApp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var logOutFromAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("log out from account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 24
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 5
        button.layer.shadowRadius = 3
        button.layer.masksToBounds = false
        button.tintColor = .white
        button.addTarget(self, action: #selector(logOutFromAccount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        view.addSubview(avatarRect)
        view.addSubview(nameLabel)
        view.addSubview(editUserButton)
        view.addSubview(AboutAppButton)
        view.addSubview(logOutFromAccountButton)
    }
    func setupConstraints() {
        setupAvatarRect()
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarRect.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(301)
            make.height.equalTo(30)
        }
        editUserButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(301)
            make.height.equalTo(48)
            
        }
        AboutAppButton.snp.makeConstraints { make in
            make.top.equalTo(editUserButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(301)
            make.height.equalTo(48)
        }
        logOutFromAccountButton.snp.makeConstraints { make in
            make.top.equalTo(AboutAppButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(301)
            make.height.equalTo(48)
        }
    }
    
    
    func setupAvatarRect() {
        avatarRect.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(219)
        }
        avatarRect.layoutIfNeeded()
        avatarRect.contentMode = .scaleAspectFill
        avatarRect.layer.cornerRadius = avatarRect.frame.size.width / 2
        avatarRect.clipsToBounds = true
        avatarRect.layer.borderWidth = 10.0
        avatarRect.layer.borderColor = UIColor.white.cgColor
    }
    @objc func logOutFromAccount() {
        let alert = UIAlertController(title: "Are you want logout", message: "All your stored data include cards will distroyed", preferredStyle: .alert)
         
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _  in
            self?.presenter.openLogin()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
         
        self.present(alert, animated: true)
    }
    @objc func exit() {
        presenter.openLogin()
    }
    @objc func openEditUser() {
        presenter.openEditUser()
    }
    @objc func close() {
        presenter.close()
    }
    @objc func openAboutApp() {
        presenter.openAboutApp()
    }
    
}
extension ProfileViewController: ProfileViewControllerProtocol {
    
}
