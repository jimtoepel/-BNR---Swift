//
//  Monster.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/16/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

class Monster {
    
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrrr"
    }
    
    var town: Town?
    var name: String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    init(town: Town?, monsterName: String ) {
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        
        if town != nil && town?.population > 0 {
            print("\(name) is terrorizing town!")
            
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
        
        
    }
    
}