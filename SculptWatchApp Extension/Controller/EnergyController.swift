//
//  EnergyController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/8/20.
//

import WatchKit
import Foundation

class EnergyController: WKInterfaceController {
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    
    
    
    
    @IBAction func tenPressed() {
        V.energyLevel = 10
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func ninePressed() {
        V.energyLevel = 9
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func eightPressed() {
        V.energyLevel = 8
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func sevenPressed() {
        V.energyLevel = 7
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func sixPressed() {
        V.energyLevel = 6
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func fivePressed() {
        V.energyLevel = 5
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func fourPressed() {
        V.energyLevel = 4
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func threePressed() {
        V.energyLevel = 3
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func twoPressed() {
        V.energyLevel = 2
        pushController(withName: "SubmitController", context: nil)
    }
    @IBAction func onePressed() {
        V.energyLevel = 1
        pushController(withName: "SubmitController", context: nil)
    }

}
