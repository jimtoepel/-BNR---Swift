//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
}


class Lexer {
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        position = position.successor()
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                case "0" ... "9":
                    // another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
                
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }
        
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                case "0" ... "9":
                    // Start of a number - need to grab the rest
                    let value = getNumber()
                    tokens.append(.Number(value))
                
                case "+":
                    tokens.append(.Plus)
                    advance()
                case " ":
                    // just advance to ignore spaces
                    advance()
                
                default:
                    // Something unexpected - need to send back an error
                    throw Error.InvalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}
