//
//  OnBoardingView.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import UIKit

class OnBoardingView: UIView {
    private lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setPageLabelText(text: String) {
        pageLabel.text = text
    }
    func setupViews() {
        addSubview(pageLabel)
    }
    func setupConstraints() {
        pageLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
