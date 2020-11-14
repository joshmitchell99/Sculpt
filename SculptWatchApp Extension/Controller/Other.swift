//
//  Other.swift
//  SculptWatchApp Extension
//
//  Created by Josh Mitchell on 11/10/20.
//

import Foundation

struct Other {
    
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
        formatter.dateFormat = "HHmm"
        
        let dateTimeInt = Int(formatter.string(from: currentDateTime))
        
        return dateTimeInt!
        
    }
    
    func getTimeString() -> String {
        
        let currentDateTime = Date()
        
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "HH"
        let hours = Int(formatter.string(from: currentDateTime))!
        formatter.dateFormat = "mm"
        let minutes = Int(formatter.string(from: currentDateTime))!
        print("HourString = ", hours, minutes)
        
        print("GGGG", String(format: "%02d:%02d", hours, minutes))
        return String(format: "%02d:%02d", hours, minutes)
        
    }
    
}
