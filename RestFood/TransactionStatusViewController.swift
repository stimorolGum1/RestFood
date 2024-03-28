//
//  TransactionStatusViewController.swift
//  RestFood
//
//  Created by Danil on 18.03.2024.
//

import UIKit
import SnapKit
protocol TransactionStatusViewControllerProtocol: AnyObject {
    
}
class TransactionStatusViewController: UIViewController {
    var presenter: TransactionStatusPresenterProtocol!
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = "Success"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = "Your order №228 will deliver on 1 table"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        return activity
    }()
    lazy var returnBackButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setTitle("Return Back", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(returnBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        animationForSuccess()
    }
    
    func setupViews() {
        view.addSubview(statusLabel)
        view.addSubview(messageLabel)
        view.addSubview(activityIndicator)
        view.addSubview(returnBackButton)
    }
    
    func setupConstraints() {
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.height.equalTo(25)
            make.width.equalTo(100)
        }
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(statusLabel.snp.bottom).offset(100)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(20)
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(50)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        returnBackButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-70)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.trailing.equalTo(-10)
        }
        
    }
    func animationForSuccess() {
        UIView.animate(withDuration: 1.5, delay: 2, animations: { [weak self] in
            self?.view.backgroundColor = #colorLiteral(red: 0.421710968, green: 1, blue: 0.1129588112, alpha: 1)
            self?.statusLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.5, delay: 3.5, animations: { [weak self] in
            self?.statusLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.5, delay: 4, animations: { [weak self] in
            self?.messageLabel.alpha = 1
        })
        UIView.animate(withDuration: 0.5, delay: 4.5, animations: { [weak self] in
            self?.returnBackButton.alpha = 1
        })
    }
    @objc func returnBack() {
        presenter.closeTransaction()
    }
    
}
extension TransactionStatusViewController: TransactionStatusViewControllerProtocol {
    
}
