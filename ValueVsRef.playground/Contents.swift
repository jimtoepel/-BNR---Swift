//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var playGroundGreeting = str

playGroundGreeting += "! How are you today?"
str



class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}


let hecate = GreekGod(name: "Hecate")
let anotherHecate = hecate

anotherHecate.name = "Another Hecate"
anotherHecate.name
hecate.name


struct Pantheon {
    var chiefGod: GreekGod
    let dateCreated = NSDate()
}


let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")

zeus.name = "Zeus Jr."
zeus.name


pantheon.chiefGod.name // "Another Hecate"
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name // ??
greekPantheon.dateCreated


let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy
