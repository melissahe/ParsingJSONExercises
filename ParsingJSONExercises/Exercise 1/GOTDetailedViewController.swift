//
//  GOTDetailedViewController.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class GOTDetailedViewController: UIViewController {

    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var titlesLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var currentLordLabel: UILabel!
    @IBOutlet weak var heirLabel: UILabel!
    @IBOutlet weak var overlordLabel: UILabel!
    
    var house: GOTHouse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    
    func setUpLabels() {
        houseNameLabel.text = house.name
        regionLabel.text = house.region
        wordsLabel.text = house.words
        titlesLabel.text = house.titles.joined(separator: "\n")
        seatsLabel.text = house.seats.joined(separator: "\n")
        currentLordLabel.text = house.currentLord
        heirLabel.text = house.heir
        overlordLabel.text = house.overlord
    }
    
}
