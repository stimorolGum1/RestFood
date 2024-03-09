//
//  FoodDetailViewController.swift
//  RestFood
//
//  Created by Danil on 03.02.2024.
//

import UIKit
import SnapKit

protocol FoodDetailViewControllerProtocol: AnyObject {
    func updateFoodCount(count: Int)
}
class FoodDetailViewController: UIViewController {
    var presenter: FoodDetailPresenterProtocol!
    lazy var imageDetail: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "food")
        image.layer.cornerRadius = 5
        return image
    }()
    lazy var foodLabel: UILabel = {
        let label = UILabel()
        label.text = "Food"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var foodDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "Krutaya eda na sve vremena"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var countOfItem: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var addPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = [.layerMaxXMinYCorner]
        button.addTarget(self, action: #selector(addFood), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var addMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = [.layerMinXMinYCorner]
        button.addTarget(self, action: #selector(removeFood), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to cart", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        button.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        view.addSubview(imageDetail)
        view.addSubview(foodLabel)
        view.addSubview(foodDetailLabel)
        view.addSubview(addPlus)
        view.addSubview(addMinus)
        view.addSubview(addToCartButton)
        view.addSubview(countOfItem)
    }
    func setupConstraints() {
        imageDetail.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        foodLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.top.equalTo(imageDetail.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        foodDetailLabel.snp.makeConstraints { make in
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.top.equalTo(foodLabel.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        addToCartButton.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(40)
        }
        countOfItem.snp.makeConstraints { make in
            make.centerX.equalTo(addToCartButton.snp.centerX)
            make.bottom.equalTo(addToCartButton.snp.top).offset(0)
            make.height.equalTo(40)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
        }
        addPlus.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.bottom.equalTo(addToCartButton.snp.top).offset(0)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        addMinus.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.bottom.equalTo(addToCartButton.snp.top).offset(0)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    @objc func addFood() {
        presenter.foodIncrement()
    }
    @objc func removeFood() {
        presenter.foodDecriment()
    }
    @objc func addToCart() {
        presenter.addToCart()
    }
}
extension FoodDetailViewController: FoodDetailViewControllerProtocol {
    func updateFoodCount(count: Int) {
        countOfItem.text = String(count)
    }
    
}
