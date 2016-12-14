//
//  RequirementsTableViewController.swift
//  ToTheResort
//
//  Created by Булат Галиев on 04.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class RequirementsTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var firstRowLabel: UILabel!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    var firstDateString: String! {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: firstDatePicker.date)
        }
    }
    
    @IBOutlet weak var secondRowLabel: UILabel!
    @IBOutlet weak var secondDatePicker: UIDatePicker!
    var secondDateString: String! {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: secondDatePicker.date)
        }
    }
    
    @IBOutlet weak var thirdRowLabel: UILabel!
    @IBOutlet weak var thirdPicker: UIPickerView!
    var thirdPick: Int! {
        get {
            return Int((thirdRowLabel?.text)!)!
        }
    }
    
    var currentShownPicker = -1
    
    var delegate: RequirementsSaver!
    var pickerDataSource = Array(1...5).map {
        String(describing: $0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatePicker()
        datePickerChanged(datePicker: firstDatePicker)
        datePickerChanged(datePicker: secondDatePicker)
        thirdPicker.delegate = self
        thirdPicker.dataSource = self
        thirdRowLabel?.text = pickerDataSource[0]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureDatePicker() {
        let minDate = Date()
        let calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let maxDate = calendar.date(byAdding: dateComponents as DateComponents, to: minDate as Date)
        firstDatePicker.minimumDate = minDate
        firstDatePicker.maximumDate = maxDate
        secondDatePicker.maximumDate = maxDate
    }
    
    func datePickerChanged(datePicker: UIDatePicker) {
        var dateLabel: UILabel
        var date: String
        switch datePicker {
        case firstDatePicker:
            dateLabel = firstRowLabel
            date = firstDateString
            secondDatePicker.minimumDate = firstDatePicker.date
        case secondDatePicker:
            dateLabel = secondRowLabel
            date = secondDateString
        default:
            return
        }
        dateLabel.text = date
    }
    
    func isPickerShown(_ pickerSection: Int) -> Bool {
        return currentShownPicker == pickerSection
    }
    
    func isPickerShown(_ pickerSection: Int, _ pickerRow: Int) -> Bool {
        return pickerRow == 0 ? true : isPickerShown(pickerSection)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            toggleDatepicker(indexPath.section)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !isPickerShown(indexPath.section, indexPath.row) {
            return 0
        }
        else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    func toggleDatepicker(_ pickerSection: Int) {
        currentShownPicker = (currentShownPicker == pickerSection) ? -1 : pickerSection
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        thirdRowLabel?.text = pickerDataSource[row]
    }
    
    @IBAction func firstDatePickerChanged(_ sender: Any) {
        datePickerChanged(datePicker: sender as! UIDatePicker)
    }
    
    @IBAction func secondDatePickerChanged(_ sender: Any) {
        datePickerChanged(datePicker: sender as! UIDatePicker)
    }
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveChangesButtonPressed(_ sender: Any) {
        let requirements = Requirements(leavingDate: firstDatePicker.date, arrivalDate: secondDatePicker.date, numberOfPlaces: thirdPick)
        self.delegate.saveRequirements(requirements)
        self.dismiss(animated: true, completion: nil)
    }
    
}
