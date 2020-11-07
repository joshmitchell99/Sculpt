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
    
}
