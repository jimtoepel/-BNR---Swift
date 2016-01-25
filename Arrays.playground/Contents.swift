//: Playground - noun: a place where people can play

import Cocoa

var bucketList =  ["Climb Mt. Everest"]

var newItems = [
    "Fly hot air ballon in Fiji",
    "Watch Lord of the Rings in a day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a Triple Rainbow"
]

bucketList += newItems


print(bucketList.count)

bucketList.removeAtIndex(2)

print(bucketList.count)
print(bucketList[0...2])

bucketList[2] += " in Australia"
bucketList

print(bucketList[2])

bucketList[0] = "Climb Mt. McKinley"

bucketList.insert("Toboggan across Alaska", atIndex: 2)

print(bucketList)


var myronsList = [
    "Climb Mt. McKinley",
    "Fly hot air ballon in Fiji",
    "Toboggan across Alaska",
    "Go on a walkabout in Australia",
    "Scuba dive in the Great Blue Hole",
    "Find a Triple Rainbow"
    ]

let equal = (bucketList == myronsList)

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel wrap"
]

var toDoList = ["Take our garbage", "Pay bills", "Cross off finished items"]
var goodWay:[String] = toDoList.reverse()

var n = toDoList.count


// Get the number of items in the list
// Remove the last object, insert it at the I spot.

for var i = 0; i < n; i++ {
    toDoList.insert(toDoList.removeLast(), atIndex: i)
}

print (toDoList)
print (goodWay)
