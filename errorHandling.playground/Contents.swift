
import Cocoa

enum Token {
    case Number(Int)
    case Plus
    case Minus
}


class Lexer {
    
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
        position = position.successor()
    }
    
}