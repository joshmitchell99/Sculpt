//
//  ProductivityController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/8/20.
//

import WatchKit
import Foundation

class ProductivityController: WKInterfaceController {
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        print("2V.happinessLevel = ", V.happinessLevel)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    
    
    
    
    @IBAction func tenPressed() {
        V.productivityLevel = 10
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func ninePressed() {
        V.productivityLevel = 9
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func eightPressed() {
        V.productivityLevel = 8
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func sevenPressed() {
        V.productivityLevel = 7
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func sixPressed() {
        V.productivityLevel = 6
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func fivePressed() {
        V.productivityLevel = 5
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func fourPressed() {
        V.productivityLevel = 4
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func threePressed() {
        V.productivityLevel = 3
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func twoPressed() {
        V.productivityLevel = 2
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func onePressed() {
        V.productivityLevel = 1
        pushController(withName: "EnergyController", context: nil)
    }

}
