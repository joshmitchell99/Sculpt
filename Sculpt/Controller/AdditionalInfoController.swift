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
    var callbackResult: (() -> ())?
    
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var productivityLabel: UILabel!
    @IBOutlet weak var anxietyLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var tirednessLabel: UILabel!
    @IBOutlet weak var whoWithLabel: UILabel!
    
    
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        callbackResult?()
        self.dismiss(animated: true)
    }
    
    
    
    
    @IBAction func happinessPressed(_ sender: UIButton) {
        V.activities[rowNum].happiness += 1
        if V.activities[rowNum].happiness == 11 {
            V.activities[rowNum].happiness = 0
        }
        happinessLabel.text! = "Happiness: " + String(V.activities[rowNum].happiness)
    }
    
    @IBAction func productivityPressed(_ sender: UIButton) {
        V.activities[rowNum].productivity += 1
        if V.activities[rowNum].productivity == 11 {
            V.activities[rowNum].productivity = 0
        }
        productivityLabel.text! = "Productivity: " + String(V.activities[rowNum].productivity)
    }
    
    @IBAction func anxietyPressed(_ sender: UIButton) {
        V.activities[rowNum].anxiety += 1
        if V.activities[rowNum].anxiety == 11 {
            V.activities[rowNum].anxiety = 0
        }
        anxietyLabel.text! = "Anxiety: " + String(V.activities[rowNum].anxiety)
    }
    
    @IBAction func energyPressed(_ sender: UIButton) {
        V.activities[rowNum].energy += 1
        if V.activities[rowNum].energy == 11 {
            V.activities[rowNum].energy = 0
        }
        energyLabel.text! = "Energy: " + String(V.activities[rowNum].energy)
    }
    
    @IBAction func tirednessPressed(_ sender: UIButton) {
        V.activities[rowNum].tiredness += 1
        if V.activities[rowNum].tiredness == 11 {
            V.activities[rowNum].tiredness = 0
        }
        tirednessLabel.text! = "Tiredness: " + String(V.activities[rowNum].tiredness)
    }
    
    
    
    
    @IBAction func whoWithPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Were you with anyone?", message: "", preferredStyle: .alert)
        
        for name in K.names {
            alert.addAction(UIAlertAction(title: name, style: .default, handler: { [self] (action) in
                V.activities[rowNum].whoWith.append(name)
                whoWithLabel.text! += V.activities[rowNum].whoWith[V.activities[rowNum].whoWith.count-1] + " "
            }))
        }
        self.present(alert, animated: true, completion:{
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
        
    }
    
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
