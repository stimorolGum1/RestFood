//
//  TableViewCell.swift
//  RestFood
//
//  Created by Danil on 25.02.2024.
//

import UIKit
import SnapKit
protocol TableViewCellProtocol {
    
}
class TableViewCell: UITableViewCell {
    lazy var addToCart: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var foodName: UILabel = {
        let label = UILabel()
        label.text = "nameOffood"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var typeFood: UILabel = {
        let label = UILabel()
        label.text = "typeOfFood"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var costOfFood: UILabel = {
        let label = UILabel()
        label.text = "costOfFood"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        contentView.addSubview(addToCart)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(foodImage)
        contentView.addSubview(foodName)
        contentView.addSubview(typeFood)
        contentView.addSubview(costOfFood)
    }
    
    func setupConstraints() {
        foodImage.snp.makeConstraints { make in
            make.height.width.equalTo(70)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
        }
        foodName.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(122)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(30)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-15)
        }
        typeFood.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(122)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        costOfFood.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(122)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(70)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        addToCart.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-15)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
            make.height.width.equalTo(20)
        }
        favoriteButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-45)
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
            make.height.width.equalTo(20)
        }
    }
}
extension TableViewCell: TableViewCellProtocol {
    
}
