//
//  SubmitController.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/8/20.
//

import WatchKit
import Foundation
import WatchConnectivity


class SubmitController: WKInterfaceController, WCSessionDelegate {
    
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
    
    
    
    
    @IBAction func submitPressed() {
        
        let dataToSend = String(other.getDate()) + "-" + other.getTimeString() + " h" + String(V.happinessLevel) + "a" + String(V.anxietyLevel) + "e" + String(V.energyLevel)
        let data: [String: Any] = ["watchData": dataToSend as Any]
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
