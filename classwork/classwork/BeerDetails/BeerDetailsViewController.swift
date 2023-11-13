//
//  BeewDetailsViewController.swift
//  classwork
//
//  Created by Павел on 13.11.2023.
//

import Foundation
import UIKit

final class BeerDetailsViewController:UIViewController{
    
    var beerModel: BeerDTO?
    
    private lazy var stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private lazy var titleView: UILabel = {
       let view = UILabel()
        return view
    }()
    
    private lazy var subTitleView: UILabel = {
       let view = UILabel()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addSubviews()
        makeConstrains()
        configure()
    }
    
    func addSubviews(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(subTitleView)
    }
    
    func makeConstrains(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configure(){
        titleView.text = beerModel?.name
        subTitleView.text = beerModel?.tagline
    }
}
