//
//  Mayor.swift
//  MonsterTown
//
//  Created by Jim Toepel on 3/6/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

struct Mayor {
    
    private var anxietyLevel = 0
    
    // Check for population change (old + new)
    
    func mayoralResponse(poulation: Int, oldpopulation: Int) {
        if oldpopulation > poulation {
            print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
        }
        
    }
    
    mutating func scaredyMayor() {
        anxietyLevel++
        print("I'm feeling an '\(anxietyLevel)' about this...")
    }
    
    
}