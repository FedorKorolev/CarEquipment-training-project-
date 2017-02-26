//
//  Estimator.swift
//  CarEquipment
//
//  Created by Фёдор Королёв on 26.02.17.
//  Copyright © 2017 Фёдор Королёв. All rights reserved.
//

import Foundation

struct Estimator {
    
    func estimate(batteryIndex: Int, allWheel: Bool, maxPerf: Bool) -> String {
        
        var price = Int()
        
        switch batteryIndex {
        case 0:
            price = 73_800
        case 1:
            price = 80_300
        case 2:
            price = 90_300
        case 3:
            price = 93_300
        default:
            price = -1
        }
        
        if allWheel {
            price += 5_000
        }
        if maxPerf {
            price += 36_200
        }
        
        let nsPrice = price as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let output = formatter.string(from: nsPrice)!
        let endIndex = output.index(output.endIndex, offsetBy: -3)
        
        return output.substring(to: endIndex)
    }
}
