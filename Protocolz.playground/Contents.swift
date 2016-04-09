//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func printTable(date: [[Int]]) {
    for row in data {
        // create an empty string
        var out = ""
        
        // append each item in this row to our string
        for item in row {
            out += " \(item) |"
        }
        
        // Done - print it!
        print(out)
    }
}



let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]



printTable(data)