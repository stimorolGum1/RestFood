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
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать"
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        return label
    }()
    lazy var loginField: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        return field
    }()
    lazy var passField: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        return field
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        
    }
    
    func setupViews() {
        view.addSubview(loginLabel)
        view.addSubview(loginField)
        view.addSubview(passField)
        view.addSubview(submitButton)
    }
    
    func setupConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(400)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
        }
        
        loginField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
            make.height.equalTo(25)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        passField.snp.makeConstraints { make in
            make.top.equalTo(loginField.snp.bottom).offset(20)
            make.height.equalTo(25)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(passField.snp.bottom).offset(20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
}
extension LoginViewController: LoginViewControllerProtocol { 
}
