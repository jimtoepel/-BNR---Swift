//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

func sortAscending(i: Int, j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sort(sortAscending)