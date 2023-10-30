//
//  BeerTableManager.swift
//  classwork
//
//  Created by Павел on 30.10.2023.
//

import Foundation
import UIKit

final class BeerTableManager{
    var tableData: [BeerDTO] = []
}

// MARK: - UITableViewDataSource

extension BeerTableManager: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = tableData[indexPath.row]
        var cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = beer.name
        configuration.secondaryText = beer.tagline
        cell.contentConfiguration = configuration
        return cell
    }
    
}
