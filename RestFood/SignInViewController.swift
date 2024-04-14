//
//  SignInViewController.swift
//  RestFood
//
//  Created by Danil on 13.04.2024.
//

import UIKit
import SnapKit

protocol SignInViewControllerProtocol: AnyObject {
    
}

class SignInViewController: UIViewController {
    var presenter: SignInPresenterProtocol!
    let screenSize = UIScreen.main.bounds.size
    lazy var viewLogin: LoginView = {
        let view = LoginView()
        view.submitButton.addTarget(self, action: #selector(authOk), for: .touchUpInside)
        view.regButton.addTarget(self, action: #selector(showReg), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
        setupAnimate()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    
    }
    func setupViews() {
        view.addSubview(viewLogin)
    }
    func setupConstraints() {
        viewLogin.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(300)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let centerY = UIScreen.main.bounds.size.width - keyboardSize.height / 2
                        viewLogin.snp.updateConstraints { make in
                            make.centerY.equalToSuperview().offset(-centerY / 2)
                        }
                        UIView.animate(withDuration: 0.3) {
                            self.view.layoutIfNeeded()
                        }
        }
    }
    @objc func keyboardWillHide(notification: Notification) {
        viewLogin.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
    }
    @objc func dismissKeyboard() {
        viewLogin.endEditing(true)
    }
    
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewLogin.alpha = 1
        })
    }

    @objc func authOk() {
        
        
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
        presenter.openSignUp()
    }
}
extension SignInViewController: SignInViewControllerProtocol {
}

