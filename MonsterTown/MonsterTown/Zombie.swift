//
//  Zombie.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/16/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation


class Zombie: Monster {
    var walksWithLimp = true
    
    final override func terrorizeTown() {
        
        // switch to check town population
        // Greater than ten? -> current flow
        // 10 or less? -> print "killed everyone, nobody left", set to 0
        // 0 -> "hungry zombie..."
        
        town?.changePopulation(-10)
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
}