//
//  ViewController.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {

    @IBOutlet weak var GOTTableView: UITableView!
    
    var houses = [GOTHouse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        GOTTableView.delegate = self
        GOTTableView.dataSource = self
    }

    func loadData() {
        //get stringified version of path of json file
            //Bundle is a representation of all the files in the project
        if let path = Bundle.main.path(forResource: "GOTData", ofType: "json") {
            //turn stringified json file into url
            //sometimes you have a string url, you need to just make it a URL; can be redundant if you already have a valid URL to use
            let myURL = URL(fileURLWithPath: path)
        
            //initialize data from your URL
            if let data = try? Data(contentsOf: myURL) {
                houses = GOTHouse.getHouse(from: data)
            }
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let destinationVC = segue.destination as? GOTDetailedViewController {
            let currentIndexPath = GOTTableView.indexPath(for: cell)!
            let currentHouse = houses[currentIndexPath.row]
            
            destinationVC.house = currentHouse
        }
    }
}

//MARK: - Table View Methods
extension GOTViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Delegate Methods - SET UP PREPARE FIRST
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)

        performSegue(withIdentifier: "detailedSegue", sender: selectedCell)
    }
    
    //Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let house = houses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath)
        
        cell.textLabel?.text = house.name
        cell.detailTextLabel?.text = house.region
        
        return cell
    }
}
