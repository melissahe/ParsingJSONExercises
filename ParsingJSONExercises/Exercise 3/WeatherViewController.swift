//
//  WeatherViewController.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weatherTableView: UITableView!
    
    var cities = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "WeatherData", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myCities = City.getCities(from: data)
                cities = myCities
            }
        }
    }
    
    //MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCity = cities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        cell.textLabel?.text = "\(currentCity.name) - \(currentCity.temp)"
        cell.detailTextLabel?.text = currentCity.weatherMain
        
        return cell
        
    }

}
