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
            let dataString = activity.description + "," + activity.subDescription + "," + activity.date + "," + String(activity.time) + "," + String(activity.startTime) + "," + String(activity.endTime) + " h" + String(activity.happiness) + " p" + String(activity.productivity) + " a" + String(activity.anxiety) + " e" + String(activity.energy) + " t" + String(activity.tiredness) + " " + activity.whoWith.description
            let nameString = activity.description + String(activity.startTime)
            
            db.collection("Users").document("Josh").collection(self.getDate()).document("todaysLog").setData([
                
                nameString : dataString
                
            ], merge: true) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Successfully uploaded data to Firestore!")
                }
            }
            
        }
    }
    
    func addEveningToFirestore(_ str: String) {
        db.collection("Users").document("Josh").collection(self.getDate()).document("evening").setData([
            "evening" : str
        ])
    }
    
    func addMorningToFirestore(_ str: String) {
        db.collection("Users").document("Josh").collection(self.getDate()).document("morning").setData([
            "morning" : str
        ])
    }
    
    
    
    
    
    //MARK: - STORING TO A PLIST
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    
    mutating func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(V.activities)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error catching the encoded array, \(error)")
        }
    }
    
    mutating func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                V.activities = try decoder.decode([Activity].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }
    
}
