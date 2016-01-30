//: Playground - noun: a place where people can play

import Cocoa

var groceryBag: Set = ["Apples", "Oranges", "Mangos"]

groceryBag.insert("Bananas")

for food in groceryBag {
    print(food)
}

let hasTacos = groceryBag.contains("Tacos")

let friendsGroceryBag = Set(["Tacos", "Guac", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGroceryBag)

let hasCommonTacos = commonGroceryBag.contains("Tacos")

let roomatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Guac", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roomatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)
