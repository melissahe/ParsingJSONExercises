//
//  Weather.swift
//  ParsingJSONExercises
//
//  Created by C4Q on 11/14/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import Foundation

class City {
    
    static var cities = [City]()
    
    let name: String
    let temp: Int
    let weatherMain: String
    
    init(name: String, temp: Int, weatherMain: String) {
        self.name = name
        self.temp = temp
        self.weatherMain = weatherMain
    }
    
    convenience init?(from city: [String : Any]) {
        guard let name = city["name"] as? String else {
            print("name didn't work")
            return nil
        }
        
        guard let main = city["main"] as? [String : Any], let temperature = main["temp"] as? Int else {
            print("main and temp didn't work")
            return nil
        }
        
        guard let weather = main["weather"] as? [[String : Any]], let mainWeather = weather[0]["main"] as? String else {
            print("weather didn't work")
            return nil
        }
        
        let temp = temperature
        let weatherMain = mainWeather
        
        self.init(name: name, temp: temp, weatherMain: weatherMain)
    }
    
    
    static func getCities(from data: Data) -> [City] {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
        
            guard let jsonDict = json as? [String : Any] else {
                return []
            }
            
            guard let cityDictArr = jsonDict["list"] as? [[String : Any]] else {
                return []
            }
            
            for cityDict in cityDictArr {
                if let city = City(from: cityDict) {
                    cities.append(city)
                }
            }
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return cities
    }
    
}
