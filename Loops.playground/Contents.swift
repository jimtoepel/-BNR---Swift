//: Playground - noun: a place where people can play

import Cocoa

var myFirstInt: Int = 0

for _ in 1...5 {
    ++myFirstInt
    print(myFirstInt)
}

for case let i in 1 ... 100 where i % 3 == 0 {
    print (i)
}