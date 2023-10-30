//
//  ViewController.swift
//  classwork
//
//  Created by Павел on 08.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource {
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .cyan
        //tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        tableView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        let url:URL = URL(string: "https://api.punkapi.com/v2/beers")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.beerData = try! decoder.decode([BeerDTO].self, from: data)
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        }).resume()
    }
}

