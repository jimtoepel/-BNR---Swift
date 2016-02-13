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


