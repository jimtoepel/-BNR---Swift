//
//  main.swift
//  cyclicalAssets
//
//  Created by Jim Toepel on 5/23/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("created \(bob)")


var laptop: Asset? = Asset(name: "Macbookly", value: 1500.00)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.00)
var backpack: Asset? = Asset(name: "Timbuk2 Messenger Bag", value:
95.00)

bob?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(hat!)

print("While Bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print("the bob variable is now \(bob)")
print("after Bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil



