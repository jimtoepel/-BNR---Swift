//: Playground - noun: a place where people can play

import Cocoa

var groceryList = ["green beans", "milk", "black beans", "pinto beans", "apples"]


func beanSifter(list: [String]) -> (beans: [String], otherGroceries: [String]){
    
    let temp = ["Test0", "Test1"]
    
    
    return(beans:temp, otherGroceries:list)
}

let result = beanSifter(groceryList)

print(result.beans)
print(result.otherGroceries)

