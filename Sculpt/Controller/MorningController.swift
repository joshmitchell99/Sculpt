//
//  MorningController.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/13/20.
//

import UIKit

class MorningController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    var other = Other()
    
    @IBOutlet weak var howWasYourSleep: UILabel!
    @IBOutlet weak var howLongDidYouSleep: UILabel!
    @IBOutlet weak var whatTimeDidYouWakeUp: UILabel!
    @IBOutlet weak var howAreYouFeeling: UILabel!
    @IBOutlet weak var howBusyIsYourDay: UILabel!
    
    var howWasYourSleepValue = 0
    var howLongDidYouSleepValue = 0
    var whatTimeDidYouWakeUpValue = 0
    var howAreYouFeelingValue = 0
    var howBusyIsYourDayValue = 0
    
    @IBAction func howWasYourSleepPressed(_ sender: UIButton) {
        howWasYourSleepValue += 1
        if howWasYourSleepValue == 11 {
            howWasYourSleepValue = 1
        }
        howWasYourSleep.text = "How was your sleep? " + String(howWasYourSleepValue)
    }
    
    @IBAction func howLongDidYouSleepPressed(_ sender: UIButton) {
        howLongDidYouSleepValue += 1
        if howLongDidYouSleepValue == 11 {
            howLongDidYouSleepValue = 1
        }
        howLongDidYouSleep.text = "How long did you sleep? " + String(howLongDidYouSleepValue)
    }
    
    @IBAction func whatTimeDidYouWakeUpPressed(_ sender: UIButton) {
        whatTimeDidYouWakeUpValue += 1
        if whatTimeDidYouWakeUpValue == 11 {
            whatTimeDidYouWakeUpValue = 1
        }
        whatTimeDidYouWakeUp.text = "What time did you wake up? " + String(whatTimeDidYouWakeUpValue)
    }
    
    @IBAction func howAreYouFeelingPressed(_ sender: UIButton) {
        howAreYouFeelingValue += 1
        if howAreYouFeelingValue == 11 {
            howAreYouFeelingValue = 1
        }
        howAreYouFeeling.text = "How are you feeling? " + String(howAreYouFeelingValue)
    }
    
    @IBAction func howBusyIsYourDayPressed(_ sender: UIButton) {
        howBusyIsYourDayValue += 1
        if howBusyIsYourDayValue == 11 {
            howBusyIsYourDayValue = 1
        }
        howBusyIsYourDay.text = "How busy is your day? " + String(howBusyIsYourDayValue)
    }
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        other.addMorningToFirestore(howWasYourSleep.text!)
        other.addMorningToFirestore(howLongDidYouSleep.text!)
        other.addMorningToFirestore(whatTimeDidYouWakeUp.text!)
        other.addMorningToFirestore(howAreYouFeeling.text!)
        other.addMorningToFirestore(howBusyIsYourDay.text!)
    }
    
    
}
