//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func <(lhs: Point, rhs: Point) -> Bool {
    let lhsDis = (sqrt((Double(lhs.x) * Double(lhs.x)) + (Double(lhs.y) * Double(lhs.y))))
    let rhsDis = (sqrt((Double(rhs.x) * Double(rhs.x)) + (Double(rhs.y) * Double(rhs.y))))
    return( lhsDis < rhsDis )
}

func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y))
}


let a = Point (x: 3, y: 4)
let b = Point (x: 3, y: 4)
let c = Point (x: 2, y: 6)
let d = Point (x: 3, y: 7)

let abEqual = (a == b)
let abNotEqual = (a != b)

let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreatherThanEqualD = (c >= d)

let e = a + b
print (e)


class Person {
    let name: String
    weak var spouse: Person?
    init(name: String, spouse: Person?) {
        self.name = name
        self.spouse = spouse
    }
}



let matt = Person(name: "Matt", spouse: nil)
let drew = Person(name: "Drew", spouse: nil)


infix operator +++ {}

func +++(lhs: Person, rhs: Person) {
    lhs.spouse = rhs
    rhs.spouse = lhs
}


matt +++ drew
matt.spouse?.name
drew.spouse?.name


