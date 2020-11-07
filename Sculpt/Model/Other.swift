//
//  Other.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/6/20.
//

import UIKit

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
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateTimeString = formatter.string(from: currentDateTime)
        
        return dateTimeString
    }
    
    func getTime() -> Int {
        
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "HHmm"
        
        let dateTimeInt = Int(formatter.string(from: currentDateTime))
        
        return dateTimeInt!
        
    }
    
    func addToFirestore(_ activities: [Activity]) {
        for activity in activities {
            let string = activity.description + activity.subDescription + activity.date + String(activity.time) + activity.startTime + activity.endTime
        }
    }
    
}
