//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
}


class Lexer {
    let input: String. CharacterView
    var position: String.CharacterView.Index
    
    init(inp: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
}