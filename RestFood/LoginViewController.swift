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
    var isLoginMove = false
    var isRegMove = false
    
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
        view.regButton.addTarget(self, action: #selector(moveLoginView), for: .touchUpInside)
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
        setupAnimate()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillAppear() {
        moveLoginView()
    }
    
    @objc func keyboardWillDisappear() {
        moveLoginView()
    }
    func setupViews() {
        view.addSubview(viewLogin)
        view.addSubview(viewReg)
    }
    func setupConstraints() {
        viewLogin.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(350)
            make.width.equalTo(390)
            //make.bottom.equalTo(-300)
        }
        viewReg.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(420)
            make.width.equalTo(390)
        }
    }
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 1
        })
    }
    @objc func openReg() { // TODO: подумать как еще можно сделать
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 0
            self?.viewReg.alpha = 1
        })
    }
    @objc func moveLoginView() {
        if isLoginMove == false {
            viewLogin.snp.updateConstraints { make in
                make.centerY.equalToSuperview().offset(-50)
                UIView.animate(withDuration: 0.3) {
                    self.viewLogin.layoutIfNeeded()
                }
            }
            isLoginMove = true
        }
        else {
            viewLogin.snp.updateConstraints { make in
                make.centerY.equalToSuperview()
                UIView.animate(withDuration: 0.3) {
                    self.viewLogin.layoutIfNeeded()
                }
            }
            isLoginMove = false
        }
        
    }
    @objc func moveRegView() {
        if isRegMove == false {
            viewReg.snp.updateConstraints { make in
                make.centerY.equalToSuperview().offset(-50)
                UIView.animate(withDuration: 0.3) {
                    self.viewReg.layoutIfNeeded()
                }
            }
            isRegMove = true
        }
        else {
            viewReg.snp.updateConstraints { make in
                make.centerY.equalToSuperview()
                UIView.animate(withDuration: 0.3) {
                    self.viewReg.layoutIfNeeded()
                }
            }
            isRegMove = false
        }
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
    
}
extension LoginViewController: LoginViewControllerProtocol {
}
