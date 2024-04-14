//
//  SignUpViewController.swift
//  RestFood
//
//  Created by Danil on 13.04.2024.
//

import UIKit
import SnapKit

protocol SignUpViewControllerProtocol: AnyObject {
    
}

class SignUpViewController: UIViewController {
    var presenter: SignUpPresenterProtocol!
    lazy var viewReg: RegView = {
        let view = RegView()
        view.backToSignIn.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        view.confirmRegButton.addTarget(self, action: #selector(confirmReg), for: .touchUpInside)
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
        view.addSubview(viewReg)
    }
    func setupConstraints() {
        viewReg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(360)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let centerY = UIScreen.main.bounds.size.width - keyboardSize.height / 2
            viewReg.snp.updateConstraints { make in
                make.centerY.equalToSuperview().offset(-centerY / 2)
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    @objc func keyboardWillHide(notification: Notification) {
        viewReg.snp.updateConstraints { make in
            make.centerY.equalToSuperview()
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func dismissKeyboard() {
        viewReg.endEditing(true)
    }
    
    func setupAnimate() {
        UIView.animate(withDuration: 1, animations: { [weak self] in
            self?.viewReg.alpha = 1
        })
    }
    
    @objc func authOk() {
        presenter.openOnboarding()
    }
    @objc func wrongReg() {
        let startX = viewReg.frame.origin.x
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            self?.viewReg.frame.origin.x = startX - 8
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: { [weak self] in
                self?.viewReg.frame.origin.x = startX + 8
            }) { _ in
                UIView.animate(withDuration: 0.1, animations: { [weak self] in
                    self?.viewReg.frame.origin.x = startX
                })
            }
        }
    }
    @objc func showLogin() {
        presenter.openLogin()
    }
    @objc func confirmReg() {
        if presenter.checkLogin(login: viewReg.loginRegField.text ?? "") &&
            presenter.checkPass(pass: viewReg.passwordRegField.text ?? "") &&
            viewReg.passwordRegField.text == viewReg.confirmPasswordRegField.text {
            presenter.openOnboarding()
        }
        else {
            wrongReg()
        }
    }
}
extension SignUpViewController: SignUpViewControllerProtocol {
}
