//: Playground - noun: a place where people can play

import Cocoa

var groceryBag: Set = ["Apples", "Oranges", "Mangos"]

groceryBag.insert("Bananas")

for food in groceryBag {
    print(food)
}

let hasTacos = groceryBag.contains("Tacos")

let friendsGroceryBag = Set(["Tacos", "Guac", "Milk", "Oranges"])
groceryBag.unionInPlace(friendsGroceryBag)

let hasCommonTacos = groceryBag.contains("Tacos")

let roomatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Guac", "Toothpaste"])
groceryBag.intersectInPlace(roomatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)
