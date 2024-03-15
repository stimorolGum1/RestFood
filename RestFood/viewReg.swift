//
//  RegView.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import UIKit

class ViewReg: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    lazy var regLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up to RestFood"
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Name"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var surnameField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Surname"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var loginRegField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Login"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var passwordRegField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Password"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var confirmPasswordRegField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Confirm password"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var confirmRegButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm sign up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupView() {
        addSubview(regLabel)
        addSubview(nameField)
        addSubview(surnameField)
        addSubview(loginRegField)
        addSubview(passwordRegField)
        addSubview(confirmPasswordRegField)
        addSubview(confirmRegButton)
    }
    func setupConstraints() {
        regLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(65)
            make.height.equalTo(30)
        }
        nameField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(regLabel.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        surnameField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(nameField.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        loginRegField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(surnameField.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        passwordRegField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(loginRegField.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        confirmPasswordRegField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(passwordRegField.snp.bottom).offset(15)
            make.height.equalTo(35)
        }
        confirmRegButton.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(confirmPasswordRegField.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
