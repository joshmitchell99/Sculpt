//
//  AdditionalInfoController.swift
//  Sculpt
//
//  Created by Josh Mitchell on 12/1/20.
//

import UIKit

class AdditionalInfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    var rowNum = -1
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        print("Activity ======== ", V.activities, rowNum)
    }
    
}
