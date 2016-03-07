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
    var name = "Monster"
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown() {
        
        if town != nil && town?.population > 0 {
            print("\(name) is terrorizing town!")
            
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
        
        
    }
    
}