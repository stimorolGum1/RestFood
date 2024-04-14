//
//  FAQViewController.swift
//  RestFood
//
//  Created by Danil on 09.04.2024.
//

import UIKit
import SnapKit
protocol AboutAppViewControllerProtocol: AnyObject {
    
}
class AboutAppViewController: UIViewController {
    var presenter: AboutAppPresenterProtocol!
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "Logo")
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "RestFood"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "About app. ITS good apps, good food on vse vremena"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var createdByLabel: UILabel = {
        let label = UILabel()
        label.text = "Created by Stimorol Gum \nContacts: \nTelegram: stimorol_gum \nMail: stmrlgum@gmail.com"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(backButton)
        view.addSubview(logoImage)
        view.addSubview(logoLabel)
        view.addSubview(aboutLabel)
        view.addSubview(createdByLabel)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.width.equalTo(25)
            make.trailing.equalTo(-10)
        }
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(200)
        }
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(20)
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(100)
        }
        aboutLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoLabel.snp.bottom).offset(50)
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(100)
        }
        createdByLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(aboutLabel.snp.bottom).offset(20)
            make.trailing.equalTo(-15)
            make.leading.equalTo(15)
            make.height.equalTo(100)
        }
    }
    @objc func close() {
        presenter.close()
    }
}
extension AboutAppViewController: AboutAppViewControllerProtocol {
    
}
