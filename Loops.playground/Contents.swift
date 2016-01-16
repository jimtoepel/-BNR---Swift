//: Playground - noun: a place where people can play

import Cocoa

var shields = 5
var blastersOverheating = false
var blasterFireCount = 0
var spaceDemonsDestroyed = 0
while shields > 0 {
    
    if spaceDemonsDestroyed == 501 {
        print("You beat the game")
        break
    }
    
    if blastersOverheating {
        print("Blasters are overheated! Cooldown initiated.")
        sleep(1)
        print("5...")
        sleep(1)
        print("4...")
        sleep(1)
        print("3...")
        sleep(1)
        print("2...")
        sleep(1)
        print("1. Blasters are ready to fire!")
        sleep(1)
        blastersOverheating = false
        blasterFireCount = 0
    }
    
    if blasterFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    // Fire Blasters!
    print ("Fire Blasters")
    ++blasterFireCount
    ++spaceDemonsDestroyed
}
