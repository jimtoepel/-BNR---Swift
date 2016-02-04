//: Playground - noun: a place where people can play

import Cocoa

var groceryList = ["green beans", "milk", "black beans", "pinto beans", "apples"]


func beanSifter(list: [String]) -> (beans: [String], otherGroceries: [String]){
    
    var temp: [String] = []
    for food in list {
        if food.hasSuffix("beans") {
            temp.append(food)
        }
    }
    
    return(beans:temp, otherGroceries:list)
}

let result = beanSifter(groceryList)

print(result.beans)
print(result.otherGroceries)

