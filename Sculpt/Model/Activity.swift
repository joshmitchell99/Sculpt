//
//  Activity.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import Foundation

class Activity {
    
    let other = Other()
    
    init(description: String, subDescription: String) {
        self.description = description
        self.subDescription = subDescription
        self.date = other.getDate()
    }
    
    var description = ""
    var subDescription = ""
    var time = 30
    
    var date = ""
    var startTime = ""
    var endTime = ""
    
}
