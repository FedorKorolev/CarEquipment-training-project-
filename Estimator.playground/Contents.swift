//: Playground - noun: a place where people can play

import UIKit




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

estimate(batteryIndex: 1, allWheel: false, maxPerf: false)
