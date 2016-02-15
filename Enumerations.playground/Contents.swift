//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment: Int {
    case Left       = 20
    case Right      = 30
    case Center     = 40
    case Justify    = 50
}

var alignment = TextAlignment.Justify

// Create a raw value
let myRawValue = 20

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // conversion worked!
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    // converstion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}

switch alignment {
case .Left:
    print("left aligned")
    
case .Right:
    print("right aligned")

case .Center:
    print("center aligned")
    
case .Justify:
    print("justified")
    
}

enum ProgramingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp        = "C++"
    case Java       
}

let myFavoriteLanguage = ProgramingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")


enum Lightbulb {
    case On
    case Off

    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
    switch self {
    case .On:
        return ambient + 150.0
    case .Off:
        return ambient
    }
}
    mutating func toggle () {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's surface temp is \(bulbTemperature)")


enum ShapeDimensions {
    // Point has no associated value - it is dimensionless
    case Point
    
    // Square's associated value is the length of one side
    case Square(Double)
    
    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)
    
    // Right triangle!
    case TriangleRight(s1: Double, s2: Double, h: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
            
        case let .Square(side):
            return side * side
            
        case let .Rectangle(width: w, height: h):
            return w * h
            
        case let .TriangleRight(s1: a, s2: b, h: c):
            return a * b * 0.5
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
            
        case let .Square(side):
            return side * 4.0
            
        case let .Rectangle(width: w, height: h):
            return (w * 2.0) + (h * 2.0)
            
        case let .TriangleRight(s1: a, s2: b, h: c):
            return a + b + c
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point
var triangleRightShape = ShapeDimensions.TriangleRight(s1: 3, s2: 4, h: 5)

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")
print("TriRight's area = \(triangleRightShape.area())")

print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")
print("TriRights's perimeter = \(triangleRightShape.perimeter())")

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fathersAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}


let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Sr", fathersAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents), motherName: "Marsha", motherAncestors: .NoKnownParents)


