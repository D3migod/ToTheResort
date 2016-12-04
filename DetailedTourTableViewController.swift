//
//  DetailedTourTableViewController.swift
//  ToTheResort
//
//  Created by Булат Галиев on 30.11.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class DetailedTourTableViewController: UITableViewController {
    
    var tourPackage: TourPackage!
    
    enum SectionType {
        case excursion
        case hotel
        case flight
        case transfer
        case book
    }
    
    func rowsInSection(_ section: SectionType) -> Int{
        switch section {
        case .excursion:
            return 5
        case .hotel:
            return 4
        case .flight:
            return 4
        case .transfer:
            return 4
        case .book:
            return 2
        }
    }
    
    func headerForSection(_ section: SectionType) -> String {
        switch section {
        case .excursion:
            return "Excursion"
        case .hotel:
            return "Hotel"
        case .flight:
            return "Flight"
        case .transfer:
            return "Transfer"
        case .book:
            return "Book"
        }
    }
    
    @IBAction func pressedOrderButton(_ sender: Any) {
    }
    
    let sections: [SectionType] = [.excursion, .hotel, .flight, .transfer, .book]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowsInSection(sections[section])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerForSection(sections[section])
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 48
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell", for: indexPath)
        switch sections[indexPath.section] {
        case .excursion:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Name"//"Название"
                cell.detailTextLabel?.text = tourPackage.excursion.name
            case 1:
                cell.textLabel?.text = "Place"//"Место"
                cell.detailTextLabel?.text = tourPackage.excursion.place
            case 2:
                let programCell = tableView.dequeueReusableCell(withIdentifier: "programCell", for: indexPath) as! ProgramTableViewCell
                programCell.programTitleLabel?.text = "Porgram"//"Программа"
                programCell.programLabel?.text = tourPackage.excursion.program
                return programCell
            case 3:
                cell.textLabel?.text = "Date"//"Дата"
                cell.detailTextLabel?.text = tourPackage.excursion.dateString
            case 4:
                cell.textLabel?.text = "Duration"//"Длительность"
                cell.detailTextLabel?.text = tourPackage.excursion.durationString
            default:
                return cell
            }
        case .hotel:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Name"//"Название"
                cell.detailTextLabel?.text = tourPackage.hotel.name
            case 1:
                cell.textLabel?.text = "Duration"//"Длительность"
                cell.detailTextLabel?.text = tourPackage.hotel.dateRange
            case 2:
                cell.textLabel?.text = "Address"//"Адрес"
                cell.detailTextLabel?.text = tourPackage.hotel.address
            case 3:
                cell.textLabel?.text = "Number of places"//"Число мест"
                cell.detailTextLabel?.text = tourPackage.hotel.numberOfPlacesString
            default:
                return cell
            }
        case .flight:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Departure"//"Место отправления"
                cell.detailTextLabel?.text = tourPackage.flight.departurePoint
            case 1:
                cell.textLabel?.text = "Departure time"//"Время отправления"
                cell.detailTextLabel?.text = tourPackage.flight.departureDateString
            case 2:
                cell.textLabel?.text = "Arrival"//"Место прилета"
                cell.detailTextLabel?.text = tourPackage.flight.arrivalPoint
            case 3:
                cell.textLabel?.text = "Arrival time"//"Время прилета"
                cell.detailTextLabel?.text = tourPackage.flight.arrivalDateString
            default:
                return cell
            }
        case .transfer:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Departure"//"Место отправления"
                cell.detailTextLabel?.text = tourPackage.flight.departurePoint
            case 1:
                cell.textLabel?.text = "Departure time"//"Время отправления"
                cell.detailTextLabel?.text = tourPackage.flight.departureDateString
            case 2:
                cell.textLabel?.text = "Arrival"//"Место прибытия"
                cell.detailTextLabel?.text = tourPackage.flight.arrivalPoint
            case 3:
                cell.textLabel?.text = "Arrival time"//"Время прибытия"
                cell.detailTextLabel?.text = tourPackage.flight.arrivalDateString
            default:
                return cell
            }
        case .book:
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Cost"//"СТОИМОСТЬ"
                cell.detailTextLabel?.text = tourPackage.price
            case 1:
                return tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
            default:
                return cell
            }
        }
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
