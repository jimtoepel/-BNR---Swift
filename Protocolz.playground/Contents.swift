//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}



func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}



func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
        print("Table: \(dataSource.description)")
        // Create arrays of the row and column labels
        let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    
        let columnLabels = (0 ..< dataSource.numberOfColumns).map { dataSource.labelForColumn($0) }
    
    
        // Create an array of the width of each row label
        let rowLabelWidths = rowLabels.map { $0.characters.count }

        // Determine length of longest row label
        guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
            return
        }
        
        // create first row containing column headers
        var firstRow: String = padding(maxRowLabelWidth) + " |"
    
        // Also keep track of the width of each column
        var columnWidths = [Int]()
    
        for columnLabel in columnLabels {
            let columnHeader = " \(columnLabel) |"
            firstRow += columnHeader
            columnWidths.append(columnHeader.characters.count)
        }
    
        print(firstRow)
    
        for i in 0 ..< dataSource.numberOfRows {
            // Pad the row lavel out so they are all the same length
            let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
            var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            var paddingAmount = columnWidths[j] - itemString.characters.count
            if paddingAmount < 0 {
                paddingAmount = 0
            }
            out += padding(paddingAmount) + itemString
            
        }
            
        
        // Done - print it!
        print(out)
    }
}

/*
let rowLabels = ["Joe", "Karen", "Fred"]
let columnLabels = ["Age", "Years of Experience"]

let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]



printTable(rowLabels,  columnLabels: columnLabels, data: data)
*/

 
 
struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        return "Department (\(name))"
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Invalid column!")
        }
    }
}

var departmentEng = Department(name: "Engineering")
departmentEng.addPerson(Person(name: "Joe", age: 30, yearsOfExperience: 6))
departmentEng.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
departmentEng.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(departmentEng)

