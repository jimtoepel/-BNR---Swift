//: Playground - noun: a place where people can play

import Cocoa

var bucketList =  ["Climb Mt. Everest"]

var newItems = [
    "Fly hot air ballon in Fiji",
    "Watch Lord of the Rings in a day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a Tripple Rainbow"
]

bucketList += newItems


print(bucketList.count)

bucketList.removeAtIndex(2)

print(bucketList.count)
print(bucketList[0...2])

bucketList[2] += " in Austrailia"
bucketList

print(bucketList[2])

bucketList[0] = "Climb Mt. McKinley"

bucketList.insert("Toboggan across Alaska", atIndex: 2)

print(bucketList)


