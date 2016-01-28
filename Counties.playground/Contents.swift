//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let orangeZips =    [28903, 20393, 20134, 39393, 39218]
let laZips =        [98209, 98780, 87689, 00848, 37478]
let sfZips =        [30029, 39920, 02039, 85859, 32020]

var countyZips = ["Orange" : orangeZips, "LA": laZips, "SF": sfZips]

let allZips = Array(countyZips.values)


print("California has the following zip codes: \(allZips)")
