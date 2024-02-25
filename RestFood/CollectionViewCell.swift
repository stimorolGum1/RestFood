//
//  CollectionViewCell.swift
//  RestFood
//
//  Created by Danil on 01.02.2024.
//

import UIKit
import SnapKit
protocol CollectionViewCellProtocol {
    
}

class CollectionViewCell: UICollectionViewCell {
    
    lazy var foodName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        self.backgroundColor = .gray
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(foodName)
    }
    
    func setupConstraints() {
        foodName.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
    }
}

extension CollectionViewCell: CollectionViewCellProtocol {
    
}
