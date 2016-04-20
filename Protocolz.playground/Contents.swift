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
    guard var maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // also keep track of the width of each column
    var columnWidths = [Int]()
    for (column, columnLabel) in columnLabels.enumerate() {
        let columnHeader = " \(columnLabel) |"
        columnWidths.append(columnHeader.characters.count)
        
        // determine item with maximum width in column
        for row in 0 ..< dataSource.numberOfRows {
            let itemString = " \(dataSource.itemForRow(row, column: column)) |"
            columnWidths[column] = max(columnWidths[column], itemString.characters.count)
        }
        
        firstRow += padding(columnWidths[column] - columnHeader.characters.count) + "\(columnHeader)"
    }
    print(firstRow)
    
    
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row label out so they are all the same length

        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            var  padAmount = columnWidths[j] - itemString.characters.count
            if padAmount < 0 {
                padAmount = 0
            }
            out += padding(padAmount) + itemString
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


struct Book {
    let title: String
    let author: Int
    let review: Int
}



struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
 
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        return "Book Collection: (\(name))"
    }
    
    mutating func addBook(book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return books[row].title
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Author"
        case 1: return "Review"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let book = books[row]
        switch column {
        case 0: return book.author
        case 1: return book.review
        default: fatalError("Invalid column!")
        }
    }
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


var sciFi = BookCollection(name: "Sci-Fi")
sciFi.addBook(Book(title: "Player of Games", author: 4, review: 5))

printTable(sciFi)
