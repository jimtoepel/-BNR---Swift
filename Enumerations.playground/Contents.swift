//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment {
    case Left
    case Right
    case Center
}

var alignment = TextAlignment.Left
alignment = .Center


switch alignment {
case .Left:
    print("left aligned")
    
case .Right:
    print("right aligned")

default:
    print("center aligned")
    
}
