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
    lazy var signInView: SignInView = {
        let view = SignInView()
        view.submitButton.addTarget(self, action: #selector(authOk), for: .touchUpInside)
        view.regButton.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
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
        view.addSubview(signInView)
    }
    func setupConstraints() {
        signInView.snp.makeConstraints { make in
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
                        signInView.snp.updateConstraints { make in
                            make.centerY.equalToSuperview().offset(-centerY / 2)
                        }
                        UIView.animate(withDuration: 0.3) {
                            self.view.layoutIfNeeded()
                        }
        }
    }
    @objc func keyboardWillHide(notification: Notification) {
        signInView.snp.updateConstraints { make in
                    make.centerY.equalToSuperview()
                }
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
    }
    @objc func dismissKeyboard() {
        signInView.endEditing(true)
    }
    
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.signInView.alpha = 1
        })
    }

    @objc func authOk() {
        
    }
    @objc func wrongAuth() {
        let startX = signInView.frame.origin.x
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            self?.signInView.frame.origin.x = startX - 8
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: { [weak self] in
                self?.signInView.frame.origin.x = startX + 8
            }) { _ in
                UIView.animate(withDuration: 0.1, animations: { [weak self] in
                    self?.signInView.frame.origin.x = startX
                })
            }
        }
    }
    @objc func showSignUp() {
        presenter.openSignUp()
    }
}
extension SignInViewController: SignInViewControllerProtocol {
}

