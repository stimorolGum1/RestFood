//
//  ViewLogin.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//


import Foundation
import UIKit

class SignInView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        alpha = 0.0
        backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9607843137, alpha: 1)
        layer.cornerRadius = 20
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        layer.shadowOpacity = 5
        layer.shadowRadius = 3
        layer.masksToBounds = false
        tintColor = .white
        setupViews()
        setupConstraints()
        setupAnimate()
    }
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to RestFood"
        label.alpha = 0.0
        label.textAlignment = .center
        label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var loginField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Login"
        field.alpha = 0.0
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
        field.alpha = 0.0
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
        button.alpha = 0.0
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(authOk), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var regButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.alpha = 0.0
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func setupViews() {
        addSubview(welcomeLabel)
        addSubview(loginField)
        addSubview(passField)
        addSubview(submitButton)
        addSubview(regButton)
    }
    func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
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
        UIView.animate(withDuration: 0.4, delay: 0.4, animations: { [weak self] in
            self?.welcomeLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 0.8, animations: { [weak self] in
            self?.loginField.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 1.2, animations: { [weak self] in
            self?.passField.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 1.6, animations: { [weak self] in
            self?.submitButton.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 2, animations: { [weak self] in
            self?.regButton.alpha = 1
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
