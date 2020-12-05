//
//  ViewController.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import UIKit

class myCell: UITableViewCell {
    
    @IBOutlet weak var enlargeButton: UIButton!
    @IBOutlet weak var shrinkButton: UIButton!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate, UITableViewDropDelegate {
    
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myContentView: UIView!
    
    let other = Other()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.delegate = self
        //self.myTableView.isEditing = true
        
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.estimatedRowHeight = 80
        
        // DRAG AND DROP
        myTableView.dragInteractionEnabled = true
        myTableView.dragDelegate = self
        myTableView.dropDelegate = self
        
        myTableView.reloadData()
    }
    
    
    
    
    
    
    
    //MARK: - IF ACTIVITIES ARE PRESSED
    
    @IBAction func activityPressed(_ sender: UIButton) {
        let activity = sender.titleLabel!.text!.lowercased()
        
        let alert = UIAlertController(title: "What exactly did you do?", message: "", preferredStyle: .alert)
        
        for subDes in activity.generateFilePath() { //K."\(activity)".subDescriptions
            alert.addAction(UIAlertAction(title: subDes, style: .default, handler: { (action) in
                V.activities.append(Activity(description: activity, subDescription: subDes))
                self.myTableView.reloadData()
            }))
        }
        self.present(alert, animated: true, completion:{
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
        
        myTableView.reloadData()
    }
    
    @objc func dismissOnTapOutside(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //SWIPE TO DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            V.activities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    
    
    
    
    //MARK: - ESSENTIAL TABLE VIEW FUNCTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return V.activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell
        
        let activity = V.activities[indexPath.row]
        
        if activity.happiness != -1 {
            cell.textLabel!.text = activity.description + ": " + activity.subDescription + " for " + String(activity.time) + "\n h" + String(activity.happiness) + " p" + String(activity.productivity) + " a" + String(activity.anxiety) + " e" + String(activity.energy) + " t" + String(activity.tiredness) + " " + activity.whoWith.description
        } else {
            cell.textLabel!.text = activity.description + ": " + activity.subDescription + " for " + String(activity.time) + "\n FILL THIS IN PLEASE!"
        }
        
        cell.backgroundColor = cell.getColor(activity.description)
        //cell.layer.borderWidth = 1
        //cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.round(withRadius: 6)
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    //MARK: - REORDERING ROWS
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = V.activities[sourceIndexPath.row]
        V.activities.remove(at: sourceIndexPath.row)
        V.activities.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        
        if session.localDragSession != nil { // Drag originated from the same app.
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    }
    
    
    
    
    
    
    
    
    
    //MARK: - SUBMIT BUTTON
    @IBAction func submitPressed(_ sender: UIButton) {
        
        let timeInterval: TimeInterval = -14400 // sets a time interval 4 hours before now.
        let currentDateTime = Date(timeIntervalSinceNow: timeInterval)
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "HH"
        var startTime = Int(formatter.string(from: currentDateTime))! * 60
        
        
        for activity in V.activities {
            activity.startTime = startTime.toDateString()
            activity.endTime = (startTime + activity.time).toDateString()
            startTime = startTime + activity.time
        }
        
        other.addToFirestore(V.activities)
        
        let alert = UIAlertController(title: "Data added!", message: "Cheers!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Great!", style: .default, handler: { (action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        myTableView.reloadData()
    }
    
    
    
    
    
    
    
    //MARK: - CHANGING HEIGHT
    
    @IBAction func enlargePressed(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        let cell = (superview as? UITableViewCell)!
        let indexPath = myTableView.indexPath(for: cell)
        V.activities[indexPath!.row].time += 5
        myTableView.reloadData()
    }
    
    @IBAction func shrinkPressed(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        let cell = (superview as? UITableViewCell)!
        let indexPath = myTableView.indexPath(for: cell)
        if V.activities[indexPath!.row].time != 5 {
            V.activities[indexPath!.row].time -= 5
        }
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(V.activities[indexPath.row].time) * 1.689
    }
    
    
    
    
    
    
    
    
    //MARK: - ADDING ADDITIONAL INFO BY CLICKING THE ACTIVITIES and reloading data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "additionalInfoSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "additionalInfoSegue" {
            if let indexPath = self.myTableView.indexPathForSelectedRow {
                let displayVC = segue.destination as! AdditionalInfoController
                displayVC.rowNum = indexPath.row
                myTableView.deselectRow(at: indexPath, animated: true)
                
                displayVC.callbackResult = {
                    self.myTableView.reloadData()
                }
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    
    
    
    
    
}
