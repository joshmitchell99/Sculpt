//
//  Event.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/7/20.
//

import Foundation

class Event {
    
    let other = Other()
    
    init(description: String, subDescription: String) {
        self.description = description
        self.date = other.getDate()
    }
    
    var description = ""
    
    var date = ""
    var eventTime = -1

}
