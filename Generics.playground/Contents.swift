//: Playground - noun: a place where people can play

import Cocoa

struct StackGenerator<T>: GeneratorType {
    
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}


struct Stack<Element>: SequenceType {
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
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
    
    // Bronze Challenge
    func filter(f: Element -> Bool) -> Stack<Element> {
        var filteredItems = Stack<Element>()
        
        // Stack
        for item in self {
            if f(item) {
                filteredItems.push(item)
            }
        }
        return filteredItems
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




func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))


func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>( first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))


var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackGenerator = StackGenerator(stack: myStack)
while let value = myStackGenerator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}


func pushItemsOntoStack<Element, S: SequenceType where S.Generator.Element == Element>(inout stack: Stack<Element>, fromSequence sequence: S) {
    for item in sequence {
        stack.push(item)
    }
}


pushItemsOntoStack(&myStack, fromSequence: [1, 2, 3])
for value in myStack {
    print("after pushing: got \(value)")
}


var myOtherStack = Stack<Int> ()
pushItemsOntoStack(&myOtherStack, fromSequence: [1, 2, 3])
pushItemsOntoStack(&myStack, fromSequence: myOtherStack)
for value in myStack {
    print("after pushing items onto stack, got \(value)")
}


// Make a stack of doubles
var someStack = Stack<Double>()
pushItemsOntoStack(&someStack, fromSequence: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0])

// Filter it for evens
let evensStack = someStack.filter { $0 % 2 == 0 }
// Print it Out
for value in evensStack {
    print(value)
}


func findAll<T: Equatable, C: CollectionType where C.Generator.Element == T>(items: C, element: T) -> [C.Index] {
    var result = Array<C.Index>()
    for idx in items.startIndex..<items.endIndex {
        if items[idx] == element { result.append(idx) }
    }
    return result
}

let intArray = [1, 2, 3, 4, 5, 3, 2, 1]
// Result : [1, 6]

let anotherIntArray = findAll(intArray, element: 2)
let anotherArray = findAll(["a", "b", "c", "A", "a"], element: "a")
