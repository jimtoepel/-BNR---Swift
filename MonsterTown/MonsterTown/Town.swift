//
//  Town.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/15/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

struct Town {
    
    var population = 9
    var numberOfStoplights = 4
    
    func printTownDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
        if population <= 0 {
            print("The town is empty, nobody left to eat")
            population = 0
        } else if population >= 2 {
            print("The zombies left \(population) people alive")
        } else if population == 1 {
            print("There is a lone survivor")
        }
    }

}