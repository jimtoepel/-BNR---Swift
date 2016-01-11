//: Playground - noun: a place where people can play

import Cocoa

var statusCode: Int = 404
var errorString: String = "The request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Informational, \(statusCode)."

case 204:
    errorString += " Successfu; but no content, \(statusCode)."

case 300...307:
    errorString += " Redirection, \(statusCode)."

case 400...417:
    errorString += " Cliet error, \(statusCode)."
    
case 500...505:
    errorString += " Server error, \(statusCode)."
    
case let unknownCode:
    errorString = "\(unknownCode) is not a known error code."
    
}