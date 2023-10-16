//
//  ViewController.swift
//  classwork
//
//  Created by Павел on 08.10.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let url:URL = URL(string: "https://api.punkapi.com/v2/beers")!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard
                let data,
                let response,
                error == nil
            else{
                return
            }
            //let str = String(data:data, encoding: .utf8)
            //print ("Полученные данные: \(str ?? "")")
            let  decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            //
            let model = try! decoder.decode([BeerDTO].self, from: data)
            print(model)
        }).resume()
        
    }


}
struct BeerDTO :Decodable {
    let id: Int
    let name: String
    let tagline: String
    let imageURL: URL
}
