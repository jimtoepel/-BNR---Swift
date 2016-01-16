//: Playground - noun: a place where people can play

import Cocoa

var count = 0
var numberOfLoops = 0

while numberOfLoops < 5 {
    
    if count < 101 {
        print("...\(count)...")
        count = count + 2
    }
    
    if count >= 100 && numberOfLoops < 4 {
        numberOfLoops++
        if numberOfLoops == 1 {
            print("That's \(numberOfLoops) time around... do it again!")
        } else {
        print("That's \(numberOfLoops) times around... do it again!")
        }
        count = 0
    }
    
    if count >= 100 && numberOfLoops == 4 {
        print("That's the final loop! we did it!")
        break
    }
}
