//: Playground - noun: a place where people can play

import Cocoa

var groceryBag: Set = ["Apples", "Oranges", "Mangos"]

groceryBag.insert("Bananas")

for food in groceryBag {
    print(food)
}

let hasApples = groceryBag.contains("Tacos")