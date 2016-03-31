//: Playground - noun: a place where people can play

import Cocoa

func printTable(data: [[Int]]) {
    for row in data {
        // Create an empty string
        var out = ""
        
        // Append each item in the row to our string
        for item in row {
            out += "\(item) !"
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