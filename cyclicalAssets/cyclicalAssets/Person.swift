//
//  Person.swift
//  cyclicalAssets
//
//  Created by Jim Toepel on 5/23/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var personalAssets = [Asset]()
    
    var description: String {
        return "Person \(name)"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            
            self?.netWorthDidChange(netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        if asset.owner == nil {
            asset.owner = self
            personalAssets.append(asset)
            accountant.gainedNewAsset(asset)
        } else {
            print("Asset is already owned")
        }
    }
    
    func loseOwnershipOfAsset(asset:Asset) {
        asset.owner = nil
        personalAssets = personalAssets.filter({ $0.name != asset.name})
        accountant.lostAsset(asset)
        
    }
    
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}