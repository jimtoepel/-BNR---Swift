//
//  Vampire.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/21/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation


class Vampire: Monster {
    var deathQuota = 1
    var vampireThralls = [""]
    
    override func terrorizeTown() {
        
        if town?.population >= 1 {
        
            town?.changePopulation(-deathQuota)
            super.terrorizeTown()
            let newThrall = ["Thrall"]
            vampireThralls += newThrall
            print(vampireThralls)
        } else {
            return
        }
        
    }
    
}