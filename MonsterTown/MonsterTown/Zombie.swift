//
//  Zombie.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/16/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation


class Zombie: Monster {
    class override var spookyNoise: String {
        return "Brains..."
    }
    
    private(set) var isFallingApart = false
    var walksWithLimp = true
    var deathQuota = 10

    final override func terrorizeTown() {
        if !isFallingApart {
            
            if town?.population >= deathQuota {
            
                town?.changePopulation(-deathQuota)
            
            } else {
        
                town?.population = 0
        
            }
        
            super.terrorizeTown()
        }
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
}