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
    lazy var viewLogin: ViewLogin = {
        let view = ViewLogin()
        view.alpha = 0.0
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        view.tintColor = .white
        view.submitButton.addTarget(self, action: #selector(authOk), for: .touchUpInside)
        view.regButton.addTarget(self, action: #selector(showReg), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewReg: ViewReg = {
        let view = ViewReg()
        view.alpha = 0.0
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.9607843137, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        view.tintColor = .white
        view.backToSignIn.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
        setupAnimate()
    }
    func setupViews() {
        view.addSubview(viewLogin)
        view.addSubview(viewReg)
    }
    func setupConstraints() {
        viewLogin.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(350)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        viewReg.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(360)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 1
        })
    }
    @objc func authOk() {
        presenter.openOnboarding()
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
    @objc func showReg() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 0
        })
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewReg.alpha = 1
        })
    }
    @objc func showLogin() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 1
        })
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewReg.alpha = 0
        })
    }
}
extension LoginViewController: LoginViewControllerProtocol {
}
