//
//  Activity.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import Foundation

class Activity {
    
    init(description: String, subDescription: String) {
        self.description = description
        self.subDescription = subDescription
    }
    
    var description = ""
    var subDescription = ""
    var time = 5
    
}
