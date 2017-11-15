//
//  GOTHouses.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class GOTHouse {
    
    static var houses: [GOTHouse] = []
    
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let titles: [String]
    let seats: [String]
    let currentLord: String
    let heir: String
    let overlord: String
    let founded: String
    let founder: String
    let diedOut: String
    
    init(name: String, region: String, coatOfArms: String, words: String, titles: [String], seats: [String], currentLord: String, heir: String, overlord: String, founded: String, founder: String, diedOut: String) {
        self.name = name
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
        self.titles = titles
        self.seats = seats
        self.currentLord = currentLord
        self.heir = heir
        self.overlord = overlord
        self.founded = founded
        self.founder = founder
        self.diedOut = diedOut
    }
    
    //what happens when you put in the dictionary - the init method used to convert your dictionary into properties you want
    convenience init?(from house: [String : Any]) {
        guard let name = house["name"] as? String else { return nil }
        let region = house["region"] as? String ?? ""
        let coatOfArms = house["coatOfArms"] as? String ?? ""
        let words = house["words"] as? String ?? ""
        let titles = house["titles"] as? [String] ?? []
        let seats = house["seats"] as? [String] ?? []
        let currentLord = house["currentLord"] as? String ?? ""
        let heir = house["heir"] as? String ?? ""
        let overlord = house["overlord"] as? String ?? ""
        let founded = house["founded"] as? String ?? ""
        let founder = house["founder"] as? String ?? ""
        let diedOut = house["diedOut"] as? String ?? ""
        
        
        self.init(name: name, region: region, coatOfArms: coatOfArms, words: words, titles: titles, seats: seats, currentLord: currentLord, heir: heir, overlord: overlord, founded: founded, founder: founder, diedOut: diedOut)
    }
    
    //used to convert the json data into information you can use
    static func getHouse(from data: Data) -> [GOTHouse] {
        do {
            //turn data into json object
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            
            //turn convert json data into an array (array of dictionaries)
            guard let allHousesDictArr = json as? [Any] else {
                return []
            }
            
            //for each thing in the array, convert it into something the convenience initializer can use
            for eachHouse in allHousesDictArr {
                if let houseDict = eachHouse as? [String : Any], let house = GOTHouse(from: houseDict) {
                    houses.append(house)
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return houses
    }
    
}
