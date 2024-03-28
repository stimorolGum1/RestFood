//
//  PurchaseViewController.swift
//  RestFood
//
//  Created by Danil on 10.03.2024.
//

import UIKit
import MapKit

protocol PurchaseViewControllerProtocol: AnyObject {
    
}
class PurchaseViewController: UIViewController {
    var presenter: PurchasePresenterProtocol!
    let paymentCell = "paymentCell"
    let cards = ["KekCard", "LolCard", "+"]
    //TODO: добавить кнопку назад
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Purchase"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 24
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var cafeMap: MKMapView = {
        let map = MKMapView()
        map.isUserInteractionEnabled = false
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    lazy var streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Mukhosransk city, Kekovaya st. 23"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 24
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var scanQrLabelHeader: UILabel = {
        let label = UILabel()
        label.text = "Scan QR code on table"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var scanQrLabel: UILabel = {
        let label = UILabel()
        label.text = "for deliver your order, scan the QR code"
        label.font = UIFont.systemFont(ofSize: 14.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var scanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Scan QR", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(openScanner), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var PaymentMethodLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose method of payment:"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var collectionOfPayment: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    lazy var confirmView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var costLabel: UILabel = {
        let label = UILabel()
        label.text = "Total cost: 10 $"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    lazy var confirmOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(openTransaction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9411764706, blue: 0.7921568627, alpha: 1)
        setupViews()
        setupConstraints()
        collectionOfPayment.delegate = self
        collectionOfPayment.dataSource = self
        collectionOfPayment.register(PaymentMethodCell.self, forCellWithReuseIdentifier: paymentCell)
    }
    
    func setupViews() { //TODO: добавить какой столик выбран
        view.addSubview(header)
        view.addSubview(addressLabel)
        view.addSubview(cafeMap)
        view.addSubview(streetLabel)
        view.addSubview(scanQrLabelHeader)
        view.addSubview(scanQrLabel)
        view.addSubview(scanButton)
        view.addSubview(PaymentMethodLabel)
        view.addSubview(collectionOfPayment)
        view.addSubview(confirmView)
        confirmView.addSubview(costLabel)
        confirmView.addSubview(confirmOrderButton)
    }
    
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(10)
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
        }
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.trailing.equalTo(-10)
        }
        cafeMap.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(0)
            make.leading.equalTo(10)
            make.height.equalTo(250)
            make.trailing.equalTo(-10)
        }
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(cafeMap.snp.bottom).offset(0)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.trailing.equalTo(-10)
        }
        scanQrLabelHeader.snp.makeConstraints { make in
            make.top.equalTo(streetLabel.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
        }
        scanQrLabel.snp.makeConstraints { make in
            make.top.equalTo(scanQrLabelHeader.snp.bottom).offset(5)
            make.leading.equalTo(10)
            make.height.equalTo(15)
            make.trailing.equalTo(-10)
        }
        scanButton.snp.makeConstraints { make in
            make.top.equalTo(scanQrLabel.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.height.equalTo(40)
            make.trailing.equalTo(-10)
        }
        PaymentMethodLabel.snp.makeConstraints { make in
            make.top.equalTo(scanButton.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
        }
        collectionOfPayment.snp.makeConstraints { make in
            make.top.equalTo(PaymentMethodLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.height.equalTo(90)
            make.trailing.equalToSuperview()
        }
        confirmView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(0)
            make.height.equalTo(100)
            make.trailing.equalTo(0)
        }
        costLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(2).offset(-5)
        }
        confirmOrderButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(40)
            make.width.equalToSuperview().dividedBy(2).offset(5)
        }
    }
    @objc func openScanner() {
        presenter.openScanner()
    }
    @objc func openTransaction() {
        presenter.openTransaction()
    }
}
extension PurchaseViewController: PurchaseViewControllerProtocol {
    
}
extension PurchaseViewController: CLLocationManagerDelegate {
    
}
extension PurchaseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: paymentCell, for: indexPath) as! PaymentMethodCell
        cell.backgroundColor = .white
        cell.paymentMethodName.text = cards[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select payment method \(indexPath.row)")
    }
    
    

}
