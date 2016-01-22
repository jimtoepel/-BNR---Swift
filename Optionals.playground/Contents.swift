//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
//errorCodeString = "404"
var errorDescription: String?

print(errorCodeString)

if let theError = errorCodeString, errorCodeInteger = Int(theError)
    where errorCodeInteger == 404 {
        errorDescription = ("\(errorCodeInteger + 200): the requested resource was not found.")
}

var upCaseErrorDescription = errorDescription?.uppercaseString
errorDescription

upCaseErrorDescription!.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

/*
let description: String
if let errorDescription = errorDescription {
    description = errorDescription
} else {
    description = "No Error"
}
*/

let description = errorDescription ?? "No error"

