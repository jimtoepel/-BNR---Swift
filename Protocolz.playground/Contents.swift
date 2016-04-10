//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}



func printTable(rowLabels: [String], data: [[Int]]) {
    
        // Create an array of the width of each row label
        let rowLabelWidths = rowLabels.map { $0.characters.count }

        // Determine length of longest row label
        guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
            return
        }
        
        
        for (i, row) in data.enumerate() {
            // Pad the row lavel out so they are all the same length
            let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
            var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        for item in row {
            out += " \(item) |"
        }
        
        // Done - print it!
        print(out)
    }
}


let rowLabels = ["Joe", "Karen", "Fred"]

let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]



printTable(rowLabels, data: data)

