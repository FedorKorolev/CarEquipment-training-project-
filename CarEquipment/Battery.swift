//
//  Battery.swift
//  CarEquipment
//
//  Created by Фёдор Королёв on 26.02.17.
//  Copyright © 2017 Фёдор Королёв. All rights reserved.
//

import Foundation

struct Battery {
    
    private let batteryMilages = [218, 259, 294, 335]
    
    func showMilege(index: Int) -> String {
        
        guard index < batteryMilages.count else {
            return "Unknown battery type"
        }
        
        var output = String(batteryMilages[index])
        output += " miles"
        return output
    }
}
