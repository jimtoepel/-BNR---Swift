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

