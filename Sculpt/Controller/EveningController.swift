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
    @IBOutlet weak var howMuchWorkDidYouDo: UILabel!
    @IBOutlet weak var whatTimeAreYouSleeping: UILabel!
    @IBOutlet weak var howFullWasYourDay: UILabel!
    @IBOutlet weak var howWarmIsTheRoom: UILabel!
    
    var howWasYourDayValue = 0
    var howMuchWorkDidYouDoValue = 0
    var whatTimeAreYouSleepingValue = 0
    var howFullWasYourDayValue = 0
    var howWarmIsTheRoomValue = 0
    
    @IBAction func howWasYourDayPressed(_ sender: UIButton) {
        howWasYourDayValue += 1
        if howWasYourDayValue == 11 {
            howWasYourDayValue = 1
        }
        howWasYourDay.text = "How was your day? " + String(howWasYourDayValue)
    }
    
    @IBAction func howMuchWorkDidYouDoPressed(_ sender: UIButton) {
        howMuchWorkDidYouDoValue += 1
        if howMuchWorkDidYouDoValue == 11 {
            howMuchWorkDidYouDoValue = 1
        }
        howMuchWorkDidYouDo.text = "How much work did you do? " + String(howMuchWorkDidYouDoValue)
    }
    
    @IBAction func whatTimeAreYouSleepingPressed(_ sender: UIButton) {
        whatTimeAreYouSleepingValue += 1
        if whatTimeAreYouSleepingValue == 11 {
            whatTimeAreYouSleepingValue = 1
        }
        whatTimeAreYouSleeping.text = "What time are you sleeping? " + String(whatTimeAreYouSleepingValue)
    }
    
    @IBAction func howFullWasYourDayPressed(_ sender: UIButton) {
        howFullWasYourDayValue += 1
        if howFullWasYourDayValue == 11 {
            howFullWasYourDayValue = 1
        }
        howFullWasYourDay.text = "How full was your day? " + String(howFullWasYourDayValue)
    }
    
    @IBAction func howWarmIsTheRoomPressed(_ sender: UIButton) {
        howWarmIsTheRoomValue += 1
        if howWarmIsTheRoomValue == 11 {
            howWarmIsTheRoomValue = 1
        }
        howWarmIsTheRoom.text = "How warm is the room? " + String(howWarmIsTheRoomValue)
    }
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        other.addEveningToFirestore(howWasYourDay.text!)
        other.addEveningToFirestore(howMuchWorkDidYouDo.text!)
        other.addEveningToFirestore(whatTimeAreYouSleeping.text!)
        other.addEveningToFirestore(howFullWasYourDay.text!)
        other.addEveningToFirestore(howWarmIsTheRoom.text!)
    }


}
