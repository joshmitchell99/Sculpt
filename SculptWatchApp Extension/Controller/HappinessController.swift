//
//  HappinessController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/8/20.
//

import WatchKit
import Foundation


class HappinessController: WKInterfaceController {
    
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
        V.happinessLevel = 10
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func ninePressed() {
        V.happinessLevel = 9
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func eightPressed() {
        V.happinessLevel = 8
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func sevenPressed() {
        V.happinessLevel = 7
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func sixPressed() {
        V.happinessLevel = 6
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func fivePressed() {
        V.happinessLevel = 5
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func fourPressed() {
        V.happinessLevel = 4
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func threePressed() {
        V.happinessLevel = 3
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func twoPressed() {
        V.happinessLevel = 2
        pushController(withName: "AnxietyController", context: nil)
    }
    @IBAction func onePressed() {
        V.happinessLevel = 1
        pushController(withName: "AnxietyController", context: nil)
    }
    
    
    
}
