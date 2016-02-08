//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

let volunteersSorted = volunteerCounts.sort { $0 < $1 }

print (volunteersSorted)

func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

var stoplights = 4

if let townPlan = makeTownGrand(1000, condition: evaluateBudget) {
    stoplights = townPlan(4, stoplights)
}

if let newTownPlan = makeTownGrand(15000, condition: evaluateBudget) {
    stoplights = newTownPlan(4, stoplights)
}

print("Knowhere has \(stoplights) stoplights.")
