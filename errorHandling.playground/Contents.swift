
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


class Parser {
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus, .Minus:
            throw Error.InvalidToken(token)
        }
    }
    
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            
            // Getting a plus after a number is legal
            case .Plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
                
            // Getting a minus after a number is legal
            case .Minus:
                // After a minus, we must get another number
                let nextNumber = try getNumber()
                value -= nextNumber
                
            // Getting a number is uncool
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        
        return value
    }

}


func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let character){
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate("11 + 3 + 5 - 4")

