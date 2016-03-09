//
//  main.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/15/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

var myTown = Town(mayor: Mayor(), population: 10000, numberOfStoplights: 6)
myTown.printTownDescription()
let ts = myTown.townSize
print(ts)



myTown.changePopulation(+5000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown

for i in 1...3 {
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
}
    
let kyleTheVampire = Vampire()
kyleTheVampire.town = fredTheZombie.town

for i in 1...5 {
    
kyleTheVampire.terrorizeTown()
kyleTheVampire.town?.printTownDescription()

}

fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)


print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print(Zombie.spookyNoise)
print(Vampire.spookyNoise)
if Zombie.isTerrifying {
    print("Run Away!")
}