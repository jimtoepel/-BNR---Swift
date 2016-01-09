//: Playground - noun: a place where people can play

import Cocoa

print("The maximu INT value is \(Int.max).")
print("The minimum INT value is \(Int.min).")
print("The maximum size for a 32-bit INT is \(Int32.max).")
print("The minimum size for a 32-bit INT is \(Int32.min).")

print("The maximum size of an unsigned INT is \(UInt.max).")
print("The minimum size of an unsigned INT is \(UInt.min).")
print("The maximum size of an 32-bit unsigned INT is \(UInt32.max).")
print("The minimum size of an 32-bit unsigned INT is \(UInt32.min).")

let numberOfPages: Int = 10 // declares the type explicitely
let numberOfChapters = 3 // Also of type Int, but inferred by the compiler

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5)
print(5 * 6)

print(10 + 2 * 5 )
print(30 - 5 - 5)
print((10 + 2) * 5)
print(30 - (5 - 5))


print (11 / 3)
print (11 % 3)
print (-11 / 3)

var x = 10
x++
print("x has been incremented to \(x)")
x--
print("x had been decremented to \(x)")

x += 10
print("x has had 10 added to it and is now \(x)")

let y: Int8 = 120
let z = y &+ 10
print("120 &+ 10 is \(z)")

let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b) // oh no~

let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)
print(12.4 % 5.0)

if d1 == d2 {
    print("d1 and d2 are the same!")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}

