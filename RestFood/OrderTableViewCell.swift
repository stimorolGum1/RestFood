//
//  OrderTableViewCell.swift
//  RestFood
//
//  Created by Danil on 09.03.2024.
//

import UIKit
import SnapKit
protocol OrderTableViewCellProtocol {
    
}
class OrderTableViewCell: UITableViewCell {
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        view.layer.shadowOpacity = 5
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "FavIconNonSelected"), for: .normal)
        button.setImage(UIImage(named: "FavIconSelected"), for: .selected)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var addToCart: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AddBtn"), for: .normal)
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
    lazy var foodNameOfCell: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var priceOfFood: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        self.setupViews()
        self.setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(foodImage)
        cellView.addSubview(foodNameOfCell)
        cellView.addSubview(priceOfFood)
        cellView.addSubview(addToCart)
        cellView.addSubview(favoriteButton)
    }
    
    func setupConstraints() {
        cellView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).inset(5)
            make.trailing.equalTo(contentView.snp.trailing).inset(5)
            make.top.equalTo(contentView.snp.top).inset(15)
            make.bottom.equalTo(contentView.snp.bottom).inset(15)
        }
        foodImage.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.top.equalTo(cellView.snp.top).offset(16)
            make.leading.equalTo(cellView.snp.leading).offset(16)
        }
        foodNameOfCell.snp.makeConstraints { make in
            make.leading.equalTo(cellView.snp.leading).offset(112)
            make.top.equalTo(cellView.snp.top).offset(15)
            make.height.equalTo(30)
            make.trailing.equalTo(cellView.snp.trailing).offset(-15)
        }
        priceOfFood.snp.makeConstraints { make in
            make.leading.equalTo(cellView.snp.leading).offset(112)
            make.top.equalTo(cellView.snp.top).offset(40)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        addToCart.snp.makeConstraints { make in
            make.trailing.equalTo(cellView.snp.trailing).offset(-15)
            make.bottom.equalTo(cellView.snp.bottom).offset(-16)
            make.height.width.equalTo(30)
        }
        favoriteButton.snp.makeConstraints { make in
            make.trailing.equalTo(cellView.snp.trailing).offset(-45)
            make.bottom.equalTo(cellView.snp.bottom).offset(-16)
            make.height.width.equalTo(30)
        }
    }
    @objc func buttonTapped(sender: UIButton) {
            sender.isSelected = !sender.isSelected
        }

}
extension OrderTableViewCell: OrderTableViewCellProtocol {
    
}
