//
//  PaymentMethodViewController.swift
//  RestFood
//
//  Created by Danil on 04.04.2024.
//

import UIKit
protocol PaymentMethodViewControllerProtocol: AnyObject {
    
}
class PaymentMethodViewController: UIViewController {
    var presenter: PaymentMethodPresenterProtocol!
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Add payment Method"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        view.tintColor = .white
        return view
    }()
    lazy var cardField: UITextField = {
        let field = CustomTextField()
        field.placeholder = "Card Number"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var nameSurnameField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Cardholder name"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var dateOfExpiredField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "MM/YY"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var cvcField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "CVC"
        field.spellCheckingType = .no
        field.backgroundColor = .white
        field.layer.cornerRadius = 4
        field.layer.borderWidth = 1
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    lazy var addPaymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        //button.addTarget(self, action: #selector(offsetView), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backButton)
        view.addSubview(header)
        view.addSubview(cardView)
        cardView.addSubview(cardField)
        cardView.addSubview(nameSurnameField)
        cardView.addSubview(dateOfExpiredField)
        cardView.addSubview(cvcField)
        cardView.addSubview(addPaymentButton)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(25)
            make.trailing.equalTo(-10)
        }
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(10)
            make.height.equalTo(25)
            make.trailing.equalTo(-35)
        }
        cardView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(220)
        }
        cardField.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.top).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        nameSurnameField.snp.makeConstraints { make in
            make.top.equalTo(cardField.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(35)
        }
        dateOfExpiredField.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.top.equalTo(nameSurnameField.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(2).offset(-20)
        }
        cvcField.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(nameSurnameField.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(2).offset(-20)
        }
        addPaymentButton.snp.makeConstraints { make in
            make.top.equalTo(cvcField.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.trailing.equalTo(-10)
        }
    }
    @objc func close() {
        presenter.close()
    }
}
extension PaymentMethodViewController: PaymentMethodViewControllerProtocol {
    
}
