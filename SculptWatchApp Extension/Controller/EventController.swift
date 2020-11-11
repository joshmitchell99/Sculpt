//
//  EventController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/10/20.
//

import WatchKit
import Foundation
import WatchConnectivity


class EventController: WKInterfaceController, WCSessionDelegate {
    
    let other = Other()
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        session.delegate = self
        session.activate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    
    
    
    
    
    
    @IBAction func waterPressed() {
        sendData("water")
    }
    
    @IBAction func mealPressed() {
        sendData("meal")
    }
    
    @IBAction func sugarPressed() {
        sendData("sugar")
    }
    
    @IBAction func alcoholPressed() {
        sendData("alcohol")
    }
    
    @IBAction func exercisePressed() {
        sendData("exercise")
    }
    
    @IBAction func sexPressed() {
        sendData("sex")
    }
    
    @IBAction func shortMedPressed() {
        sendData("shortMed")
    }
    
    @IBAction func longMedPressed() {
        sendData("longMed")
    }
    
    @IBAction func joPressed() {
        sendData("jo")
    }
    
    @IBAction func napPressed() {
        sendData("nap")
    }
    
    
    
    
    
    
    
    
    func sendData(_ eventName: String) {
                
        let dataToSend = String(other.getDate()) + "-" + String(other.getTime()) + " " + eventName
        let data: [String: Any] = ["event": dataToSend as Any]
        session.sendMessage(data, replyHandler: nil, errorHandler: nil)
        
        pushController(withName: "InitialPage", context: nil)
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: - WATCHCONNECTIVITY
    let session = WCSession.default
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            print("Watch WCSession Activated!!")
        case .notActivated:
            print("Watch WCSession Not Activated!!")
        case .inactive:
            print("Watch WCSession Inactive!!")
        }
    }
    
}
