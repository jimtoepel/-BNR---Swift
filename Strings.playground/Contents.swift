//: Playground - noun: a place where people can play

import Cocoa

let playground = "Hello, playground"

var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print("\(c)")
}

let oneCoolDude = "\u{1f60E}"
let aAcute = "\u{0061}\u{0301}"
for scalar in mutablePlayground.unicodeScalars {
    print("\(scalar.value) ")
}

let aAcutePrecomposed = "\u{00E1}"

let b = (aAcute == aAcutePrecomposed) // true

print("aAcute: \(aAcute.characters.count); aAcuteDecomposed: \(aAcutePrecomposed.characters.count)")

let fromStart = playground.startIndex
let toPosition = 4 // the First position is 0
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end] // 'o'

let range = fromStart ... end
let firstFive = playground[range] // 'Hello'


var playgroundTest = ""
playgroundTest += "\u{0048}\u{0065}\u{006c}\u{006c}\u{006f}\u{002c}\u{0020}\u{0070}\u{006c}\u{0061}\u{0079}\u{0067}\u{0072}\u{006f}\u{0075}\u{006e}\u{0064}"
