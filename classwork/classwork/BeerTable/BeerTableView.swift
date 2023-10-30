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
        tableView.backgroundColor = .cyan
        //tableView.dataSource = self
        return tableView
    }()
    
    private lazy var spinnerView = UIActivityIndicatorView(style: .large)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        makeConstrains()
        spinnerView.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BeerTableView{
    func addSubviews(){
        [tableView].forEach{
            self.addSubviews($0)
        }
    }
    
    func makeConstrains(){
        [tableView, spinnerView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
