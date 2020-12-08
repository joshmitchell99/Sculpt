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
    
    @IBOutlet weak var sleepQuality: UILabel!
    @IBOutlet weak var sleepLength: UILabel!
    @IBOutlet weak var wakeTime: UILabel!
    @IBOutlet weak var initialFeeling: UILabel!
    @IBOutlet weak var businessOfDay: UILabel!
    
    var sleepQualityVal = 0
    var sleepLengthVal = 0
    var wakeTimeVal = 0
    var initialFeelingVal = 0
    var businessOfDayVal = 0
    
    @IBAction func sleepQualityPressed(_ sender: UIButton) {
        sleepQualityVal += 1
        if sleepQualityVal == 11 {
            sleepQualityVal = 1
        }
        sleepQuality.text = "How was your sleep? " + String(sleepQualityVal)
    }
    
    @IBAction func sleepLengthPressed(_ sender: UIButton) {
        sleepLengthVal += 1
        if sleepLengthVal == 11 {
            sleepLengthVal = 1
        }
        sleepLength.text = "How long did you sleep? " + String(sleepLengthVal)
    }
    
    @IBAction func wakeTimePressed(_ sender: UIButton) {
        wakeTimeVal += 1
        if wakeTimeVal == 11 {
            wakeTimeVal = 1
        }
        wakeTime.text = "What time did you wake up? " + String(wakeTimeVal)
    }
    
    @IBAction func initialFeelingPressed(_ sender: UIButton) {
        initialFeelingVal += 1
        if initialFeelingVal == 11 {
            initialFeelingVal = 1
        }
        initialFeeling.text = "How are you feeling? " + String(initialFeelingVal)
    }
    
    @IBAction func businessOfDayPressed(_ sender: UIButton) {
        businessOfDayVal += 1
        if businessOfDayVal == 11 {
            businessOfDayVal = 1
        }
        businessOfDay.text = "How busy is your day? " + String(businessOfDayVal)
    }
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let stringToSave = "sleepQuality" + String(sleepQualityVal) + "sleepLength" + String(sleepLengthVal) + "wakeTime" + String(wakeTimeVal) + "initialFeeling" + String(initialFeelingVal) + "businessOfDay" + String(businessOfDayVal)
        other.addMorningToFirestore(stringToSave)
    }
    
    
}
