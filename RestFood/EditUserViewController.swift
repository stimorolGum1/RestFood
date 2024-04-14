//
//  EditUserViewController.swift
//  RestFood
//
//  Created by Danil on 28.03.2024.
//

import UIKit
import SnapKit
protocol EditUserViewControllerProtocol: AnyObject {
    
}
class EditUserViewController: UIViewController {
    var presenter: EditUserPresenterProtocol!
    var offset: CGFloat = 0.0
    lazy var avatarRect: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ava")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var changeAvatarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = . clear
        button.setTitle("Click here to change avatar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var editUser: EditUserView = {
        let view = EditUserView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func keyboardWillShow(notification: Notification) { //TODO: переделать под диагонали экрана
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            switch diagonalCalculate() {
            case 5.8...6.3:
                offset = -keyboardFrame.height / 1.5
            case 4.7:
                offset = -keyboardFrame.height + 15
            default:
                break
            }
            
            editUser.snp.updateConstraints { make in
                make.top.equalTo(changeAvatarButton.snp.bottom).offset(offset)
            }
            
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.backButton.alpha = 0
                self?.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        editUser.snp.updateConstraints { make in
            make.top.equalTo(changeAvatarButton.snp.bottom).offset(15)
        }
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.backButton.alpha = 1
            self?.view.layoutIfNeeded()
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupViews() {
        view.addSubview(avatarRect)
        view.addSubview(backButton)
        view.addSubview(changeAvatarButton)
        view.addSubview(editUser)
    }
    
    func setupConstraints() {
        setupAvatarRect()
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(25)
            make.trailing.equalTo(-10)
        }
        changeAvatarButton.snp.makeConstraints { make in
            make.top.equalTo(avatarRect.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(250)
        }
        editUser.snp.makeConstraints { make in
            make.top.equalTo(changeAvatarButton.snp.bottom).offset(15)
            make.height.equalTo(350)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
    }
    func setupAvatarRect() {
        avatarRect.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(219)
        }
        avatarRect.layoutIfNeeded()
        avatarRect.contentMode = .scaleAspectFill
        avatarRect.layer.cornerRadius = avatarRect.frame.size.width / 2
        avatarRect.clipsToBounds = true
        avatarRect.layer.borderWidth = 10.0
        avatarRect.layer.borderColor = UIColor.white.cgColor
    }
    @objc func close() {
        presenter.close()
    }
    func diagonalCalculate() -> Double {
        let ppi = UIScreen.main.scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163);
        let diagonal = sqrt(pow(UIScreen.main.bounds.size.width * UIScreen.main.scale / ppi, 2) + pow(UIScreen.main.bounds.size.height * UIScreen.main.scale / ppi, 2))
        let screenSize = Double(String(format: "%0.1f", diagonal))!
        print(screenSize)
        return screenSize
    }
}
extension EditUserViewController: EditUserViewControllerProtocol {
    
}
