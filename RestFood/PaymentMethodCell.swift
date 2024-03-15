//
//  PaymentMethodCell.swift
//  RestFood
//
//  Created by Danil on 15.03.2024.
//

import Foundation
import UIKit
import SnapKit
protocol PaymentMethodCellProtocol {
    
}

class PaymentMethodCell: UICollectionViewCell {
    
    lazy var paymentMethodName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
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
        contentView.addSubview(paymentMethodName)
    }
    
    func setupConstraints() {
        paymentMethodName.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
}

extension PaymentMethodCell: CollectionViewCellProtocol {
    
}
