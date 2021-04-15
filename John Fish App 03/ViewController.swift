//
//  ViewController.swift
//  John Fish App 01
//
//  Created by Mallah  on 4/13/19.
//  Copyright © 2019 Mallah . All rights reserved.
//

import UIKit
import CoreData


var scheduleCellEntries: [ScheduleCell] = [ ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "05:30", time02: "06:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "06:30", time02: "07:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "07:30", time02: "08:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "08:30", time02: "09:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "09:30", time02: "10:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "10:30", time02: "11:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "11:30", time02: "12:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "12:30", time02: "13:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "13:30", time02: "14:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "14:30", time02: "15:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "15:30", time02: "16:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "16:30", time02: "17:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "17:30", time02: "18:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "18:30", time02: "19:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "19:30", time02: "20:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "20:30", time02: "21:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "21:30", time02: "22:30"), ScheduleCell(id: 1, textButtonState: false, timeButtonState: false, text: "...", time01: "22:30", time02: "23:30")]

var goalsCellEntries: [GoalsCell] = [GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal"), GoalsCell(id: 1, buttonState: false, text: "Goal")]

var toDoCellEntries: [ToDoCell] = [ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo"), ToDoCell(id: 1, buttonState: false, text: "ToDo")]

var motivationCellEntries: [MotivationCell]!


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    //Inits

    init(persistenceService: PersistenceService){
        self.persistenceService = persistenceService
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
   
    
    //Variables & Constants ...
    
    let persistenceService: PersistenceService
    
    var scheduleScore: Int = 0
    var scheduleTotalScore: Int = 0
    
    var goalsScore: Int = 0
    var goalsTotalScore: Int = 0
    
    var toDosScore: Int = 0 
    var toDosTotalScore: Int = 0
    
    var totalScore: Int = 0
    
    var numberholder: Int = 0
    
    
    //Outlets
    
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var scheduleScoreLabel: UILabel!
    
    @IBOutlet weak var goalsView: UIView!
    @IBOutlet weak var goalsTableView: UITableView!
    @IBOutlet weak var goalsScoreLabel: UILabel!
    
    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var toDoScoreLabel: UILabel!
    
    @IBOutlet weak var motivationView: UIView!
    @IBOutlet weak var motivationTableView: UITableView!
    
    @IBOutlet weak var textDisplayingView: UIView!
    @IBOutlet weak var textDisplayingInnerView: UIView!
    @IBOutlet weak var textDisplayingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scheduleView.clipsToBounds = true
        scheduleView.layer.cornerRadius = 15
        goalsView.clipsToBounds = true
        goalsView.layer.cornerRadius = 15
        toDoView.clipsToBounds = true
        toDoView.layer.cornerRadius = 15
        motivationView.clipsToBounds = true
        motivationView.layer.cornerRadius = 15
        
        // Delegate & Datasources
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        goalsTableView.delegate = self
        goalsTableView.dataSource = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        motivationTableView.delegate = self
        motivationTableView.dataSource = self
        
        textDisplayingView.isHidden = true
        textDisplayingView.clipsToBounds = true
        textDisplayingView.layer.cornerRadius = 15
        textDisplayingView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.2996100256, blue: 0.3515504464, alpha: 1)
        
        textDisplayingInnerView.isHidden = true
        textDisplayingInnerView.clipsToBounds = true
        textDisplayingInnerView.layer.cornerRadius = 15
        textDisplayingInnerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        
        textDisplayingLabel.isHidden = true
        
        
        persistenceService.saveContext()
        
        //Loads the initial scores on the View
        presentScoreOnScreen(from: scheduleScoreLabel)
        presentScoreOnScreen(from: goalsScoreLabel)
        presentScoreOnScreen(from: toDoScoreLabel)
        
        
    }
    
    //helper Functions
    
    ///updates Score
    func presentScoreOnScreen(from label: UILabel){
        if label == scheduleScoreLabel{
            
            scheduleScoreLabel.text = "\(scheduleScore)/\(scheduleTotalScore)"
            
        }else if label == goalsScoreLabel{
            
            goalsScoreLabel.text = "\(goalsScore)/\(goalsCellEntries.count)"
            
        }else{
            toDoScoreLabel.text = "\(toDosScore)/\(toDoCellEntries.count * 3)"
            
        }
    }
    
    ///calculates the totally POSSIBLE score of the schedule
    func activeScheduleTasks(scheduleTableView: UITableView){
        if let indexPath = self.scheduleTableView.indexPathForView(scheduleTableView){
            if scheduleCellEntries[indexPath.row].text != "..." {
                scheduleTotalScore += 5
                
            }
        }
        
        
    }
    
    
    //declaring the number of rows within the tableviews
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int?
        
        if tableView == scheduleTableView{
            count = scheduleCellEntries.count
            
        }else if tableView == goalsTableView{
            count = goalsCellEntries.count
            
        }else if tableView == toDoTableView{
            count = toDoCellEntries.count
            
        }else if tableView == motivationTableView{
            count = 2
            
        }
        return count!
    }
    
    //fetching data into the cells of the tableviews
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == scheduleTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! scheduleTableViewCell
            
            cell.scheduleStartTimeField.text = scheduleCellEntries[indexPath.row].time01
            
            cell.scheduleEndTimeField.text = scheduleCellEntries[indexPath.row].time02
            
            cell.scheduleTextField.text = scheduleCellEntries[indexPath.row].text
            
            
            if scheduleCellEntries[indexPath.row].timeButtonState == false{
                cell.scheduleDateCheckBox.isSelected = false
                
            }else{
                cell.scheduleDateCheckBox.isSelected = true
                
            }
            
            if scheduleCellEntries[indexPath.row].textButtonState == false{
                cell.scheduleTextCheckBox.isSelected = false
                
            }else{
                cell.scheduleTextCheckBox.isSelected = true
                
            }
            
            return cell
            
            
            
        } else if tableView == goalsTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "goalsCell", for: indexPath) as! goalsTableViewCell
            
            cell.goalsTextField.text = goalsCellEntries[indexPath.row].text
            
            
            if goalsCellEntries[indexPath.row].buttonState == false{
                cell.goalsCheckBox.isSelected = false
                
            }else{
                cell.goalsCheckBox.isSelected = true
                
            }
            
            if goalsCellEntries[indexPath.row].buttonState == false{
                cell.goalsCheckBox.isSelected = false
                
            }else{
                cell.goalsCheckBox.isSelected = true
                
            }
            
            
            
            return cell
        } else if tableView == toDoTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as!toDoTableViewCell
            
            cell.toDoTextField.text = toDoCellEntries[indexPath.row].text
            
            
            if toDoCellEntries[indexPath.row].buttonState == false{
                cell.toDoCheckBox.isSelected = false
                
            }else{
                cell.toDoCheckBox.isSelected = true
                
            }
            
            if toDoCellEntries[indexPath.row].buttonState == false{
                cell.toDoCheckBox.isSelected = false
                
            }else{
                cell.toDoCheckBox.isSelected = true
                
            }
            
            return cell
        } else /*if tableView == motivationTableView*/ {
            let cell = tableView.dequeueReusableCell(withIdentifier: "motivationCell", for: indexPath) as! motivationTableViewCell
            cell.motivationImage.image = #imageLiteral(resourceName: "placeholderImage")
            cell.motivationTextField.text = "Write your Motivation here!"
            
            return cell
        }
    }
    
    // CheckBox Button Action for the Times on the Schedule
    @IBAction func timeCheckboxIsPressed(_ sender: UIButton) {
        
        
        if let indexPath = self.scheduleTableView.indexPathForView(sender){
            print("scheduleTimeButton tapped at indexPath \(indexPath)")
            
            
            if scheduleCellEntries[indexPath.row].timeButtonState == true{
                scheduleCellEntries[indexPath.row].timeButtonState = false
                sender.isSelected = false
                scheduleScore -= 3
                totalScore -= 3
                ///updates Score
                presentScoreOnScreen(from: scheduleScoreLabel)
                
            }else if scheduleCellEntries[indexPath.row].timeButtonState == false && scheduleCellEntries[indexPath.row].text != "..."{
                scheduleCellEntries[indexPath.row].timeButtonState = true
                sender.isSelected = true
                scheduleScore += 3
                totalScore += 3
                ///updates Score
                presentScoreOnScreen(from: scheduleScoreLabel)
            }
            
        }else{
            print("Button indexPath not found")
            
        }
        print("Total Score:\(totalScore)")
        print("Schedule Score:\(scheduleScore)")
    }
    
    // CheckBox Button Action for the Text on the Schedule
    @IBAction func textCheckboxIsPressed(_ sender: UIButton) {
        
        
        if let indexPath = self.scheduleTableView.indexPathForView(sender){
            print("scheduleTextButton tapped at indexPath \(indexPath)")
            
            
            if scheduleCellEntries[indexPath.row].textButtonState == true{
                scheduleCellEntries[indexPath.row].textButtonState = false
                sender.isSelected = false
                scheduleScore -= 2
                totalScore -= 2
                ///updates Score
                presentScoreOnScreen(from: scheduleScoreLabel)
                
            }else if scheduleCellEntries[indexPath.row].textButtonState == false && scheduleCellEntries[indexPath.row].text != "..."{
                scheduleCellEntries[indexPath.row].textButtonState = true
                sender.isSelected = true
                scheduleScore += 2
                totalScore += 2
                ///updates Score
                presentScoreOnScreen(from: scheduleScoreLabel)
                
            }
            
        }else{
            print("Button indexPath not found")
            
        }
        print("Total Score:\(totalScore)")
        print("Schedule Score:\(scheduleScore)")
    }
    
    // CheckBox Button Action for the GoalsText on the Schedule
    @IBAction func goalsCheckBox(_ sender: UIButton) {
        
        
        if let indexPath = self.goalsTableView.indexPathForView(sender){
            print("goalsButton tapped at indexPath \(indexPath)")
            
            if goalsCellEntries[indexPath.row].buttonState == true{
                goalsCellEntries[indexPath.row].buttonState = false
                sender.isSelected = false
                goalsScore -= 1
                totalScore -= 1
                ///updates Score
                presentScoreOnScreen(from: goalsScoreLabel)
                
            }else{
                goalsCellEntries[indexPath.row].buttonState = true
                sender.isSelected = true
                goalsScore += 1
                totalScore += 1
                ///updates Score
                presentScoreOnScreen(from: goalsScoreLabel)
                
            }
            
        }else{
            print("Button indexPath not found")
            
        }
        print("Total Score:\(totalScore)")
        print("Goals Score:\(goalsScore)")
        
    }
    
    // CheckBox Button Action for the ToDosText on the Schedule
    @IBAction func toDosCheckBox(_ sender: UIButton) {
        
        
        
        if let indexPath = self.toDoTableView.indexPathForView(sender){
            print("toDosButton tapped at indexPath \(indexPath)")
            
            if toDoCellEntries[indexPath.row].buttonState == true{
                toDoCellEntries[indexPath.row].buttonState = false
                sender.isSelected = false
                toDosScore -= 3
                totalScore -= 3
                ///updates Score
                presentScoreOnScreen(from: toDoScoreLabel)
                
            }else{
                toDoCellEntries[indexPath.row].buttonState = true
                sender.isSelected = true
                toDosScore += 3
                totalScore += 3
                ///updates Score
                presentScoreOnScreen(from: toDoScoreLabel)
                
            }
            
        }else{
            print("Button indexPath not found")
            
        }
        print("Total Score:\(totalScore)")
        print("ToDos Score:\(toDosScore)")
        
    }
    
    // This changes the Value in the Array when the text t
    // in the TextField changes
    @IBAction func scheduleStartTimeHasChanged(_ textField: UITextField) {
        
        if textField.text != nil{
            if let indexPath = self.scheduleTableView.indexPathForView(textField){
                scheduleCellEntries[indexPath.row].time01 = textField.text!
                textDisplayingLabel.text = textField.text!
                print(scheduleCellEntries)
                
            }else{
                print("dint work")
                
            }
        }else{
            print("sender is nil")
        }
    }
    
    // This changes the Value in the Array when the text t
    // in the TextField changes
    @IBAction func scheduleEndTimeHasChanged(_ textField: UITextField) {
        
        if textField.text != nil{
            if let indexPath = self.scheduleTableView.indexPathForView(textField){
                scheduleCellEntries[indexPath.row].time02 = textField.text!
                textDisplayingLabel.text = textField.text!
                print(scheduleCellEntries)
                
            }else{
                print("dint work")
                
            }
        }else{
            print("sender is nil")
        }
    }
    
    // This changes the Value in the Array when the text t
    // in the TextField changes
    @IBAction func scheduleTextHasChanged(_ textField: UITextField) {
        
        if textField.text != nil{
            if let indexPath = self.scheduleTableView.indexPathForView(textField){
                scheduleCellEntries[indexPath.row].text = textField.text!
                textDisplayingLabel.text = textField.text!
                print(scheduleCellEntries)
                
            }else{
                print("dint work")
                
            }
        }else{
            print("sender is nil")
        }
    }
    
    // This changes the Value in the Array when the text t
    // in the TextField changes
    @IBAction func goalsTextChangeDidEnd(_ textField: UITextField) {
        
        if textField.text != nil{
            if let indexPath = self.goalsTableView.indexPathForView(textField){
                goalsCellEntries[indexPath.row].text = textField.text!
                textDisplayingLabel.text = textField.text!
                print(goalsCellEntries)
                
            }else{
                print("dint work")
                
            }
        }else{
            print("sender is nil")
        }
    }
    
    // This changes the Value in the Array when the text t
    // in the TextField changes
    @IBAction func toDoTextHasChanged(_ textField: UITextField) {
        if textField.text != nil{
            if let indexPath = self.toDoTableView.indexPathForView(textField){
                toDoCellEntries[indexPath.row].text = textField.text!
                textDisplayingLabel.text = textField.text!
                print(toDoCellEntries)
                
            }else{
                print("dint work")
                
            }
        }else{
            print("sender is nil")
        }

    }
    
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        textDisplayingView.isHidden = false
        textDisplayingInnerView.isHidden = false
        textDisplayingLabel.isHidden = false
        
        
        textDisplayingLabel.text = sender.text!
        
        
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        textDisplayingView.isHidden = true
        textDisplayingInnerView.isHidden = true
        textDisplayingLabel.isHidden = true
    }
    
    
    @IBAction func scheduleTextCoreData(_ sender: UITextField) {
        func safingArrays() {
            let scheduleArray = ScheduleArray(context: persistenceService.context)
            
            if let indexPath = self.scheduleTableView.indexPathForView(sender){
                scheduleArray.id = Int16(scheduleCellEntries[indexPath.row].id)
                scheduleArray.textButtonState = scheduleCellEntries[indexPath.row].textButtonState
                
                //persistenceService.saveContext()
            }
        }
    
    }
    
    
    
    
    // if touched outside the Keyboard the keyboard disappears
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        
    }
    
}

