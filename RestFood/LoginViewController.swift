//
//  ViewController.swift
//  RestFood
//
//  Created by Danil on 29.01.2024.
//

import UIKit
import SnapKit

protocol LoginViewControllerProtocol: AnyObject {
    
}

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterProtocol!
    
    lazy var viewLogin: UIView = {
        let view = UIView()
        view.alpha = 0.0
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to RestFood"
        label.alpha = 0.0
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var loginField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Login"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var passField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Password"
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(wrongAuth), for: .touchUpInside)
        return button
    }()
    lazy var regButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
        setupAnimate()
    }
    func setupViews() {
        view.addSubview(viewLogin)
        viewLogin.addSubview(welcomeLabel)
        viewLogin.addSubview(loginField)
        viewLogin.addSubview(passField)
        viewLogin.addSubview(submitButton)
        viewLogin.addSubview(regButton)
        
    }
    func setupConstraints() {
        viewLogin.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(350)
            make.width.equalTo(390)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(70)
            make.height.equalTo(25)
        }
        loginField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        passField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(loginField.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        submitButton.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(passField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
        regButton.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(submitButton.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
    }
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 1
        })
        UIView.animate(withDuration: 1, delay: 1, animations: { [weak self] in
            self?.welcomeLabel.alpha = 1
        })
    }
    @objc func wrongAuth() {
        let startX = viewLogin.frame.origin.x
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            self?.viewLogin.frame.origin.x = startX - 8
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: { [weak self] in
                self?.viewLogin.frame.origin.x = startX + 8
            }) { _ in
                UIView.animate(withDuration: 0.1, animations: { [weak self] in
                    self?.viewLogin.frame.origin.x = startX
                })
            }
        }
    }
    
}
extension LoginViewController: LoginViewControllerProtocol {
}
