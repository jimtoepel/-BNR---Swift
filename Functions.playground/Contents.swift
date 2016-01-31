//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, Playground!")
}
printGreeting()

func printPersonalGreetings(names:String...) {
    for name in names {
        print("Hello \(name), welcome to your playground.")
    }
}
printPersonalGreetings("Alex", "Chris", "Drew", "Jim")


func divisionDescription(forNumerator num: Double,
                    andDenominator den: Double,
            withPunctuation punctuation: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(punctuation)"
}

print(divisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!"))


var error = "The request failed:"

func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
    errorString += " bad request."
    }
}

appendErrorCode(400, toErrorString: &error)
error


func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}

areaOfTriangle(withBase: 3.0, andHeight: 5.0)



func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int])
{
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}


let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens)")
print("The odd numbers are \(theSortedNumbers.odds)")




