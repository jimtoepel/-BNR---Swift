//: Playground - noun: a place where people can play

import Cocoa

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}


func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    print("Table: \(dataSource.description)")
    
        // Create arrays of the row and colum labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map { dataSource.labelForColumn($0)
    }
    
        // Create an array of the width of each row label
        let rowLabelWidths = rowLabels.map { $0.characters.count}
    
    
        // determine length of longest row label
        guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
                return
        }
    
        // Create first row containing column headers
        var firstRow: String = padding(maxRowLabelWidth) + " |"
    
        // Also keep track of the width of each column
        var columnWidths = [Int]()
    
    for (column, columnLabel) in columnLabels.enumerate() {
        let columnHeader = " \(columnLabel) |"
        columnWidths.append(columnHeader.characters.count)
        
        // determine item with maximum width in column
        for row in 0 ..< dataSource.numberOfRows {
            let itemString = "\(dataSource.itemForRow(row, column: column)) |"
            columnWidths[column] = max(columnWidths[column], itemString.characters.count)
        }
        
        firstRow += padding(columnWidths[column] - columnHeader.characters.count) + "\(columnHeader)"
        }
        print(firstRow)
    

        for i in 0 ..< dataSource.numberOfRows {
    
            // Pad the row label out so they are all the same length
            let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
            var out = rowLabels[i] + padding(paddingAmount) + " |"
    
    
        // Append each item in the row to our string
            for j in 0 ..< dataSource.numberOfColumns {
                let item = dataSource.itemForRow(i, column: j)
                let itemString = " \(item) |"
                let paddingAmount = columnWidths[j] - itemString.characters.count // I think something is fixed here.
                out += padding(paddingAmount) + itemString
            }
        
        // Done - print it!
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
    
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    let c1 = "Age"
    let c2 = "Years of Experience"
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }

    init(name: String) {
        self.name = name
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
        case 0: return c1 // This defines the length of the column
        case 1: return c2
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
            case 0: return person.age
            case 1: return person.yearsOfExperience
            default: fatalError("invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 1000, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))


printTable(department)

