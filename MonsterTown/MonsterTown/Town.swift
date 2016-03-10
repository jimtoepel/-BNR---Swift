//
//  Town.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/15/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    var mayor = Mayor()
    var population = Int() {
        didSet(oldPopulation) {
                print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    var numberOfStoplights: Int
    
    init(region: String, population: Int, stoplights: Int){
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights); region: \(region)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }

}