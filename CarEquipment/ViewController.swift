//
//  ViewController.swift
//  CarEquipment
//
//  Created by Фёдор Королёв on 26.02.17.
//  Copyright © 2017 Фёдор Королёв. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        allWheelSwich.isOn = false
    }
    
    let estimator = Estimator()
    
    // Battery
    @IBAction func batterySelected(_ sender: UISegmentedControl) {
        let battery = Battery()
        mileage.text = battery.showMilege(index: sender.selectedSegmentIndex)
        checkAllWheelAndPerformance()
        estimatePrice()
        toggleMaxPerfLabel()
    }
    
    @IBOutlet weak var batterySelector: UISegmentedControl!
    @IBOutlet weak var mileage: UILabel!
    
    
    // All-Wheel
    @IBOutlet weak var allWheelSwich: UISwitch!
    @IBAction func allWheelSwiched(_ sender: UISwitch) {
        checkAllWheelAndPerformance()
        estimatePrice()
    }
    
    // Maximum Performance
    @IBAction func maxPerformanceSwiched(_ sender: UISwitch) {
        estimatePrice()
        toggleMaxPerfLabel()
    }
    @IBOutlet weak var maxPerformanceSwich: UISwitch!
    @IBOutlet weak var maxPerformanceLabel: UILabel!
    
    
    // Price
    @IBOutlet weak var priceLabel: UILabel!
    

    func estimatePrice() {
    priceLabel.text = estimator.estimate(batteryIndex: batterySelector.selectedSegmentIndex,
                       allWheel: allWheelSwich.isOn,
                       maxPerf: maxPerformanceSwich.isOn)
    }
    
    func checkAllWheelAndPerformance() {
        
        // Check if All-Wheel drive is enabled by factory (for big battaries)
        if batterySelector.selectedSegmentIndex >= 2 {
            allWheelSwich.isOn = true
            allWheelSwich.isEnabled = false
        } else {
            // Restore the switch
            allWheelSwich.isEnabled = true
        }
        
        // Check for Maximum Performance option avability (only for 100 kWh)
        if batterySelector.selectedSegmentIndex == 3 {
            maxPerformanceSwich.isOn = true
            maxPerformanceSwich.isEnabled = true
        } else {
            maxPerformanceSwich.isOn = false
            maxPerformanceSwich.isEnabled = false
        }
        
    }

    func toggleMaxPerfLabel() {
        if maxPerformanceSwich.isOn {
            maxPerformanceLabel.isHidden = false
        } else {
            maxPerformanceLabel.isHidden = true
        }
    }
    
}

