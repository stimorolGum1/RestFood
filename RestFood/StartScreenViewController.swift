//
//  StartScreenViewController.swift
//  RestFood
//
//  Created by Danil on 07.03.2024.
//

import UIKit
import SnapKit
protocol StartScreenViewControllerProtocol: AnyObject {
    
}
class StartScreenViewController: UIViewController {
    var presenter: StartScreenPresenterProtocol!
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.0
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    lazy var welcomeToLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to RestFood"
        label.alpha = 0
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = "Searching nearest restoraunt"
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "startScreen")!)
        setupViews()
        setupConstraints()
        setupAnimate()
    }
    func setupViews() {
        view.addSubview(logoImage)
        view.addSubview(welcomeToLabel)
        view.addSubview(statusLabel)
    }
    
    func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(150)
        }
        welcomeToLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(logoImage.snp.bottom).offset(10)
        }
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(welcomeToLabel.snp.bottom).offset(100)
        }
    }
    func setupAnimate() {
        UIView.animate(withDuration: 1.5, animations: { [weak self] in
            self?.logoImage.alpha = 1
        })
        UIView.animate(withDuration: 1.5, delay: 1.5, animations: { [weak self] in
            self?.welcomeToLabel.alpha = 1
        })
        blink()
    }
    func blink() {
            UIView.animate(withDuration: 1, delay: 3, options: [.curveEaseInOut, .autoreverse, .repeat],
                           animations: { [weak self] in
                self?.statusLabel.alpha = 1.0
            },
                           completion: { [weak self] _ in
                self?.statusLabel.alpha = 0.0
            })
        }

        func stopBlink() {
            self.statusLabel.alpha = 1.0
        }
}
extension StartScreenViewController: StartScreenViewControllerProtocol {
    
}
