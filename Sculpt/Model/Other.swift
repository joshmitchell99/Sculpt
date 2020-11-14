//
//  Other.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/6/20.
//

import UIKit
import Firebase

struct Other {
    
    func getCurrentHour() -> Int {
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "HH"
        
        let dateTimeInt = Int(formatter.string(from: currentDateTime))
        
        return dateTimeInt!
    }
    
    func getDate() -> String {
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.timeStyle = .long
        formatter.dateFormat = "dd.MM.yyyy"
        
        let dateTimeString = formatter.string(from: currentDateTime)
        
        return dateTimeString
    }
    
    func getTime() -> Int {
        
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "HH:mm"
        
        let dateTimeInt = Int(formatter.string(from: currentDateTime))
        
        return dateTimeInt!
        
    }
    
    
    
    
    
    
    
    
    //MARK: - ADDING TO FIRESTORE
    
    func getRandomId(string: String) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return string + String((0..<20).map{ _ in letters.randomElement()! })
    }
    
    let db = Firestore.firestore()
    
    func addToFirestore(_ activities: [Activity]) {
        print("Activities to be passed in: ", activities)
        for activity in activities {
            let string = activity.description + "," + activity.subDescription + "," + activity.date + "," + String(activity.time) + "," + String(activity.startTime) + "," + String(activity.endTime)
            
            db.collection("Users").document("Josh").collection(self.getDate()).document(self.getRandomId(string: "LOG")).setData([
                
                "ActivityString" : string
                
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Successfully uploaded data to Firestore!")
                }
            }
            
        }
    }
    
    func addWatchDataToFirestore(_ data: String) {
        
        print("Watch data to be passed in: ", data)
        
        db.collection("Users").document("Josh").collection(self.getDate()).document((self.getRandomId(string: "WATCH"))).setData([
            
            "WatchData" : data
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Successfully uploaded data to Firestore!")
            }
        }
    }
    
    func addEventToFirestore(_ data: String) {
        
        print("Event to be passed in: ", data)
        
        db.collection("Users").document("Josh").collection(self.getDate()).document(self.getRandomId(string: "EVENT")).setData([
            
            "Event" : data
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Successfully uploaded data to Firestore!")
            }
        }
    }
    
    func addMorningToFirestore(_ data: String) {
        
        db.collection("Users").document("Josh").collection(self.getDate()).document(self.getRandomId(string: "MORNING")).setData([
            
            "MorningString" : data
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Successfully uploaded data to Firestore!")
            }
        }
    }
    
    func addEveningToFirestore(_ data: String) {
        
        db.collection("Users").document("Josh").collection(self.getDate()).document(self.getRandomId(string: "EVENING")).setData([
            
            "EveningString" : data
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Successfully uploaded data to Firestore!")
            }
        }
    }
    
}
