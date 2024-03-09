//
//  OrderViewController.swift
//  RestFood
//
//  Created by Danil on 09.03.2024.
//

import UIKit
import SnapKit
protocol OrderViewControllerProtocol: AnyObject {
    
}
class OrderViewController: UIViewController {
    var presenter: OrderPresenterProtocol!
    let tableCell = "OrderTableCell"
    
    lazy var header: UILabel = {
        let label = UILabel()
        label.text = "Orders"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Purchase", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.2704343498, blue: 0.1398084164, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(wrongAuth), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9882352941, blue: 0.8470588235, alpha: 1)
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableCell)
    }
    
    func setupViews() {
        view.addSubview(header)
        view.addSubview(tableView)
        view.addSubview(purchaseButton)
    }
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(10)
            make.height.equalTo(25)
            make.trailing.equalTo(-10)
        }
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(header.snp.bottom).offset(30)
            make.bottom.equalTo(purchaseButton.snp.top).offset(-15)
        }
        purchaseButton.snp.makeConstraints { make in
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.top.equalTo(tableView.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
}

extension OrderViewController: OrderViewControllerProtocol {
    
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return presenter.modelCountForCollection()
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return presenter.modelCountForTableView(section: section)
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableCell", for: indexPath) as! TableViewCell
        //        cell.foodNameOfCell.text = presenter.prepareName(index: indexPath)
        //        cell.priceOfFood.text = presenter.prepareCost(index: indexPath)
        cell.foodNameOfCell.text = "Food num \(indexPath.row)"
        cell.priceOfFood.text = "price of food num \(indexPath.row)"
        return cell
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        print("clicked \(indexPath.row)")
    //        presenter.openDetailFood()
    //    }
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return presenter.modelSection(section: section)
    //    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30)) //TODO: сделать верстку со snapkit
    //        headerLabel.text = presenter.modelSection(section: section)
    //        headerLabel.font = UIFont.systemFont(ofSize: 30)
    //        return headerLabel
    //    }
    
    
}
