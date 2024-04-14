//
//  EditUserView.swift
//  RestFood
//
//  Created by Danil on 06.04.2024.
//

import UIKit
class EditUserView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changeNameField: UITextField = {
        let field = CustomTextField()
        field.placeholder = "Name"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Surname:"
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changeSurnameField: UITextField = {
        let field = CustomTextField()
        field.placeholder = "Surname"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email:"
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changeEmailField: UITextField = {
        let field = CustomTextField()
        field.placeholder = "Email"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "password:"
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changePasswordField: UITextField = {
        let field = CustomTextField()
        field.placeholder = "Password"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var applyChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apply changes", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func setupViews() {
        addSubview(nameLabel)
        addSubview(changeNameField)
        addSubview(surnameLabel)
        addSubview(changeSurnameField)
        addSubview(emailLabel)
        addSubview(changeEmailField)
        addSubview(passwordLabel)
        addSubview(changePasswordField)
        addSubview(applyChangeButton)
    }
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(25)
            make.width.equalTo(100)
            make.leading.equalTo(15)
        }
        changeNameField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(changeNameField.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.width.equalTo(100)
            make.leading.equalTo(15)
        }
        changeSurnameField.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(5)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(changeSurnameField.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.width.equalTo(100)
            make.leading.equalTo(15)
        }
        changeEmailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(changeEmailField.snp.bottom).offset(5)
            make.height.equalTo(25)
            make.width.equalTo(100)
            make.leading.equalTo(15)
        }
        changePasswordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        applyChangeButton.snp.makeConstraints { make in
            make.top.equalTo(changePasswordField.snp.bottom).offset(10)
            make.height.equalTo(48)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
    
    func setupAnimate() {
        UIView.animate(withDuration: 0.4, delay: 0.4, animations: { [weak self] in
            self?.nameLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 0.8, animations: { [weak self] in
            self?.changeNameField.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 1.2, animations: { [weak self] in
            self?.changeSurnameField.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 1.6, animations: { [weak self] in
            self?.changeSurnameField.alpha = 1
        })
        UIView.animate(withDuration: 0.4, delay: 2, animations: { [weak self] in
            self?.applyChangeButton.alpha = 1
        })
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
