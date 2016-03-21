//
//  main.swift
//  MonsterTown
//
//  Created by Jim Toepel on 2/15/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

var myTown = Town(population: 10000, stoplights: 6)

myTown.printTownDescription()
let ts = myTown.townSize
print(ts)


2
myTown.changePopulation(+5000)
print("Size: \(myTown.townSize); population: \(myTown.population)")

var fredTheZombie:Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")


for i in 1...3 {
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()
}
fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)

var convenientZombie = Zombie(limp: true, fallingApart: false)


let kyleTheVampire = Vampire(town: fredTheZombie?.town, monsterName: "Kyle")


for i in 1...5 {
    
kyleTheVampire.terrorizeTown()
kyleTheVampire.town?.printTownDescription()

}

fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)


print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print(Zombie.spookyNoise)
print(Vampire.spookyNoise)
if Zombie.isTerrifying {
    print("Run Away!")
}

fredTheZombie = nil