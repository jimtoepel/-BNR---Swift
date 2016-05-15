//: Playground - noun: a place where people can play

import Cocoa

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}



var intStack = Stack<Int>()


intStack.push(1)
intStack.push(2)
var doubledStack = intStack.map({ 2 * $0})

print(intStack.pop()) // Prints optional (2)
print(intStack.pop()) // Prints optional (1)
print(intStack.pop()) // Prints optional nil

print(doubledStack.pop())  // Prints optional (4)
print(doubledStack.pop())  // Prints optional (2)

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop())



func myMap<T, U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = [ "one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths) // Prints [ 3, 3, 5]
