//
//  Accountant.swift
//  cyclicalAssets
//
//  Created by Jim Toepel on 5/23/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> ()
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }
    
    func lostAsset(asset: Asset) {
        netWorth -= asset.value
    }
}

