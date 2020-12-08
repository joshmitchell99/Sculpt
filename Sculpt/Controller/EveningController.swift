//
//  EveningController.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/13/20.
//

import UIKit

class EveningController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    var other = Other()
    
    @IBOutlet weak var howWasYourDay: UILabel!
    @IBOutlet weak var howMuchWork: UILabel!
    @IBOutlet weak var bedTime: UILabel!
    @IBOutlet weak var dayFullness: UILabel!
    @IBOutlet weak var roomWarmth: UILabel!
    
    var howWasYourDayVal = 0
    var howMuchWorkVal = 0
    var bedTimeVal = 0
    var dayFullnessVal = 0
    var roomWarmthVal = 0
    
    @IBAction func howWasYourDayPressed(_ sender: UIButton) {
        howWasYourDayVal += 1
        if howWasYourDayVal == 11 {
            howWasYourDayVal = 1
        }
        howWasYourDay.text = "How was your day? " + String(howWasYourDayVal)
    }
    
    @IBAction func howMuchWorkPressed(_ sender: UIButton) {
        howMuchWorkVal += 1
        if howMuchWorkVal == 11 {
            howMuchWorkVal = 1
        }
        howMuchWork.text = "How much work did you do? " + String(howMuchWorkVal)
    }
    
    @IBAction func bedTimePressed(_ sender: UIButton) {
        bedTimeVal += 1
        if bedTimeVal == 11 {
            bedTimeVal = 1
        }
        bedTime.text = "What time are you sleeping? " + String(bedTimeVal)
    }
    
    @IBAction func dayFullnessPressed(_ sender: UIButton) {
        dayFullnessVal += 1
        if dayFullnessVal == 11 {
            dayFullnessVal = 1
        }
        dayFullness.text = "How full was your day? " + String(dayFullnessVal)
    }
    
    @IBAction func roomWarmthPressed(_ sender: UIButton) {
        roomWarmthVal += 1
        if roomWarmthVal == 11 {
            roomWarmthVal = 1
        }
        roomWarmth.text = "How warm is the room? " + String(roomWarmthVal)
    }
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let stringToSave = "howWasYourDay" + String(howWasYourDayVal) + "howMuchWork" + String(howMuchWorkVal) + "bedTime" + String(bedTimeVal) + "dayFullness" + String(dayFullnessVal) + "roomWarmth" + String(roomWarmthVal)
        other.addEveningToFirestore(stringToSave)
    }


}
