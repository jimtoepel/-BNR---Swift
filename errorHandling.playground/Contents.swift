
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
    
}