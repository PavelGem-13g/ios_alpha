//
//  ViewController.swift
//  classwork
//
//  Created by Павел on 08.10.2023.
//

import UIKit
import Foundation

final class BeerTableViewController: UIViewController {

    private lazy var contentView: BeerTableView = {
       let view = BeerTableView()
        return view
    }()
    
    private let service = BeerService()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBeer{ beers in
            DispatchQueue.main.async {
                self.contentView.configure(with: beers)
            }
        }
    }
}

