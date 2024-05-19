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
    let tableCell = "tableCell"
    lazy var cell: CollectionViewCell = {
        let cell = CollectionViewCell()
        return cell
    }()
    lazy var tableViewCell: TableViewCell = {
        let cell = TableViewCell()
        return cell
    }()
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Welcome, Kenni"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collection.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.sectionIndexBackgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
        collection.delegate = self
        collection.dataSource = self
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: idCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableCell)
        let locationManager = LocationManager.shared
        locationManager.fetchCurrentLocation { placemark in
            if let placemark = placemark {
                locationManager.printLocationDetails()
                
                // Update the labels with location details
            }
        }
    }
    func setupViews() {
        view.addSubview(header)
        view.addSubview(collection)
        view.addSubview(tableView)
    }
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        collection.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(header.snp.bottom).offset(10)
            make.height.equalTo(90)
        }
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(collection.snp.bottom).offset(15)
            make.bottom.equalToSuperview()
        }
    }
}
extension MainScreenViewController: MainScreenViewControllerProtocol {
}
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.modelCountForCollection()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .white
        cell.foodName.text = presenter.prepareCategoriesForCollection(index: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSection = indexPath.item
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.contentView.backgroundColor = .orange
            }
        tableView.scrollToRow(at: IndexPath(row: 0, section: selectedSection), at: .top, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
            cell.contentView.backgroundColor = .white
            }
    }
}
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.modelCountForCollection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.modelCountForTableView(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.foodNameOfCell.text = presenter.prepareName(index: indexPath)
        cell.priceOfFood.text = presenter.prepareCost(index: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked \(indexPath.row)")
        presenter.openDetailFood()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.modelSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30)) //TODO: сделать верстку со snapkit
        headerLabel.text = presenter.modelSection(section: section)
        headerLabel.font = UIFont.systemFont(ofSize: 30)
        return headerLabel
    }
    
    
}
extension MainScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
