//
//  main.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/15/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

var myTown = Town()



myTown.changePopulation(500)
myTown.printTownDescription()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()



