//
//  MainScreenViewController.swift
//  RestFood
//
//  Created by Danil on 31.01.2024.
//

import Foundation
import SnapKit

protocol MainScreenViewControllerProtocol: AnyObject {
    
}

class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenterProtocol!
    let idCell = "Cell"
    //let cell = CollectionViewCell() // сделать замыканием
    let cell: CollectionViewCell = {
        let cell = CollectionViewCell()
        return cell
    }()
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать, Кенни"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        collection.delegate = self
        collection.dataSource = self
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: idCell)
    }
    
    func setupViews() {
        view.addSubview(header)
        view.addSubview(collection)
    }
    
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        collection.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(header.snp.bottom).offset(10)
            make.height.equalTo(140)
        }
    }
}

extension MainScreenViewController: MainScreenViewControllerProtocol {
    
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.modelCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .white
        cell.foodName.text = presenter.prepareElem(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked \(indexPath.row)")
        presenter.openDetailFood()
    }
    
}
