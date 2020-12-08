//
//  Activity.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import Foundation

class Activity: Codable {
        
    init(description: String, subDescription: String) {
        self.description = description
        self.subDescription = subDescription
    }
    
    var description = ""
    var subDescription = ""
    var time = 30
    
    var date = ""
    var startTime = ""
    var endTime = ""
    
    var happiness = -1
    var productivity = -1
    var anxiety = -1
    var energy = -1
    var tiredness = -1
    var whoWith = [String]()
    
}
