
import Cocoa

enum Token {
    case Number(Int)
    case Plus
    case Minus
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
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue // CLEVER I like this.
                advance()
                
            default:
                // A non-digit - go back!
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
                
            case "-":
                tokens.append(.Minus)
                advance()
                
            case " ":
                // skip and avoid the spaces
                advance()
                
            default:
                // something happened. Errors go here
                
                throw Error.InvalidCharacter(nextCharacter)
            }
        }
        
        return tokens
        
    }
    
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
    } catch {
        print("An error occures: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("1 + 2 + abcdefg")

