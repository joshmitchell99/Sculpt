//
//  ViewController.swift
//  Sculpt
//
//  Created by Josh Mitchell on 11/4/20.
//

import UIKit

class myCell: UITableViewCell {
    
    @IBOutlet weak var resizeLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate, UITableViewDropDelegate {
    

    @IBOutlet weak var myTableView: UITableView!
    
    var activities: [Activity] = []
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
        
        setTimeLabels()
    }
    
    
    
    
    
    
    
    
    //MARK: - IF ACTIVITIES ARE PRESSED
    
    @IBAction func activityPressed(_ sender: UIButton) {
        let activity = sender.titleLabel!.text!.lowercased()
        
        let alert = UIAlertController(title: "What exactly did you do?", message: "", preferredStyle: .alert)
        
        for subDes in activity.generateFilePath() { //K."\(activity)".subDescriptions
            alert.addAction(UIAlertAction(title: subDes, style: .default, handler: { (action) in
                self.activities.append(Activity(description: activity, subDescription: subDes))
                self.myTableView.reloadData()
            }))
        }
        self.present(alert, animated: true, completion: nil)
        
        myTableView.reloadData()
        
    }
    
    
    
    
    
    
    
    
    //MARK: - ESSENtIAL TABLE VIEW FUNCTIONS

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        var activity = activities[indexPath.row]
        
        cell.textLabel!.text = activity.description + ": " + activity.subDescription + " for " + String(activity.time)
        cell.backgroundColor = cell.getColor(activity.description)
        //cell.layer.borderWidth = 1
        //cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.round(withRadius: 6)
        
        return cell
    }
    
    
    
    
    
    
    
    
    //MARK: - CHANGING HEIGHT
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if activities[indexPath.row].time == 60 {
            activities[indexPath.row].time = 5
        } else {
            activities[indexPath.row].time += 5
        }
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(activities[indexPath.row].time) * 2.4
    }

    
    
    
    
    //MARK: - REORDERING ROWS
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.activities[sourceIndexPath.row]
        activities.remove(at: sourceIndexPath.row)
        activities.insert(movedObject, at: destinationIndexPath.row)
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
    
    
    
    
    
    
    //MARK: - TIME LABELS
    
    @IBOutlet weak var firstTime: UILabel!
    @IBOutlet weak var secondTime: UILabel!
    @IBOutlet weak var thirdTime: UILabel!
    @IBOutlet weak var fourthTime: UILabel!
    
    func setTimeLabels() {
        let hour = other.getCurrentHour()
        
        firstTime.text = String(hour.minus(3)) + " -"
        secondTime.text = String(hour.minus(2)) + " -"
        thirdTime.text = String(hour.minus(1)) + " -"
        fourthTime.text = String(hour) + " -"
    }
    
    
    
    
    
    
    
    //MARK: - SUBMIT BUTTON
    @IBAction func submitPressed(_ sender: UIButton) {
        var startTime = "0000"
        var activitiesToAdd = [Activity]()
        
//        for activity in activities {
//            if startTime == "0000" {
//                startTime = String(other.getCurrentHour().minus(4))
//            }
//            let endTime = startTime.addMilitaryTime(activity.time)
//
//            activity.startTime = startTime
//            activity.endTime = endTime
//            activitiesToAdd.append(activity)
//
//            startTime = endTime
//        }
        
        for activity in activitiesToAdd {
            print(activity.description, activity.subDescription, activity.date, activity.time, activity.startTime, activity.endTime)
        }
        
        other.addToFirestore(activities)
    }
    
    
}

