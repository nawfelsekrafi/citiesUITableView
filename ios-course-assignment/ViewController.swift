//
//  ViewController.swift
//  ios-course-assignment
//
//  Created by Nawfel Sekrafi on 27/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var citiesTableView: UITableView!
    
    var cities: [String] = ["Sousse", "Gaza", "Medina", "NewYork"]
    var countryCity : [String: String] = ["Sousse":"Tunisia", "Gaza":"Palestine", "Medina": "KSA", "NewYork":"USA"]
    
    struct Constants {
        static let cellIdentifier = "MagicCityCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = countryCity[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        return tableViewCell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("city:  \(cities[indexPath.row])")
        print("country \(countryCity[cities[indexPath.row]] ?? "")")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
