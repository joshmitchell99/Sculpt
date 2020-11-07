//
//  Extensions.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import UIKit

// ROUNDS THE CORNERS OF A TABLE VIEW CELL
extension UITableViewCell {
    func round(withRadius radius: CGFloat) {
        let mask = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.frame = self.bounds
        shape.path = mask.cgPath
        self.layer.mask = shape
    }
}

extension UITableViewCell {
    func getColor(_ description: String) -> UIColor {
        switch description {
        case "work":
            return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        case "play":
            return #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1)
        case "exercise":
            return #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        case "meal":
            return #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        case "personal":
            return #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        case "social":
            return #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case "other":
            return #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
            
        default:
            print("Error extensions.swift - you've added in activities without defining their colors!!!")
            return #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        }
    }
}

extension String {
    func generateFilePath() -> [String] {
        
        let activity = self
        
        switch activity {
        case "work":
            return K.work.subDescriptions
        case "play":
            return K.play.subDescriptions
        case "exercise":
            return K.exercise.subDescriptions
        case "meal":
            return K.meal.subDescriptions
        case "personal":
            return K.personal.subDescriptions
        case "social":
            return K.social.subDescriptions
        case "other":
            return K.other.subDescriptions
            
            
        default:
            print("Error extensions.swift - you've added an activity but not put it in the String extension!")
            return ["ERROR"]
        }
    }
}

extension Int {
    
    func minus(_ int: Int) -> Int {
        var number = self
        number -= int
        if number < 0 {
            return 24 + number
        }
        return number
    }
}
