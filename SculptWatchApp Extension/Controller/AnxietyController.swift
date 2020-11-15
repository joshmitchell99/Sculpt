//
//  AnxietyController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/8/20.
//

import WatchKit
import Foundation

class AnxietyController: WKInterfaceController {
    
    
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
        V.anxietyLevel = 10
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func ninePressed() {
        V.anxietyLevel = 9
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func eightPressed() {
        V.anxietyLevel = 8
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func sevenPressed() {
        V.anxietyLevel = 7
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func sixPressed() {
        V.anxietyLevel = 6
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func fivePressed() {
        V.anxietyLevel = 5
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func fourPressed() {
        V.anxietyLevel = 4
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func threePressed() {
        V.anxietyLevel = 3
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func twoPressed() {
        V.anxietyLevel = 2
        pushController(withName: "EnergyController", context: nil)
    }
    @IBAction func onePressed() {
        V.anxietyLevel = 1
        pushController(withName: "EnergyController", context: nil)
    }

}
