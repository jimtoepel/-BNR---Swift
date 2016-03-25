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
    var deathQuota = 10
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String){
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town:town, monsterName:monsterName)
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee")
        }
    }

    convenience required init?(town: Town?, monsterName: String)
    {
        self.init(town: town, monsterName: monsterName)
        walksWithLimp = false
        isFallingApart = false

    }
    

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
    
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
}