//: Playground - noun: a place where people can play

import Cocoa


typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self + 1.60934 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatBed: Bool { get }
}


struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname:String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}