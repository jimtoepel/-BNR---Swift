//
//  Monster.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/16/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

class Monster {
    
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        
        if town != nil {
            print("\(name) is terrorizing town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
        
    }
    
}