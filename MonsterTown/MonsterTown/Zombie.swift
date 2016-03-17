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
    

    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String){
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town:town, monsterName:monsterName)
    }
    
    
    var deathQuota = 10

    final override func terrorizeTown() {
        if !isFallingApart {
            
            if town?.population >= deathQuota {
            
                town?.changePopulation(-deathQuota)
                town!.mayor.scaredyMayor()
            
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