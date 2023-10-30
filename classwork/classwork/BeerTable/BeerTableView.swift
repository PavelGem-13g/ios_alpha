//
//  BeerTableView.swift
//  classwork
//
//  Created by Павел on 30.10.2023.
//

import Foundation
import UIKit

final class BeerTableView: UIView{
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = tableManager
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    
    private lazy var tableManager = BeerTableManager()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        makeConstrains()
        spinnerView.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: [BeerDTO]){
        tableManager.tableData = viewModel
        tableView.reloadData()
    }
}

private extension BeerTableView{
    func addSubviews(){
        [tableView, spinnerView].forEach{ item in
            self.addSubview(item)
        }
    }
    
    func makeConstrains(){
        [tableView, spinnerView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.leftAnchor),
            self.topAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor),
            self.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor),
            self.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
