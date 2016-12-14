//
//  RegistrationTableViewController.swift
//  ToTheResort
//
//  Created by Булат Галиев on 14.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    let registrationChecker = RegistrationChecker()

    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    var repeatedPassword: String {
        get {
            return repeatedPasswordTextField?.text == nil ? "" : (repeatedPasswordTextField?.text)!
        }
    }
    @IBOutlet weak var loginTextField: UITextField!
    var login: String {
        get {
            return loginTextField?.text == nil ? "" : (loginTextField?.text)!
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
    var password: String {
        get {
            return passwordTextField?.text == nil ? "" : (passwordTextField?.text)!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func registerButtonPressed(_ sender: Any) {
        if let warning = registrationChecker.checkInput(email: login, password: password, repeatedPassword: repeatedPassword) {
            Alert().showAlertMessage(showingViewController: self, alertTitle: "Incorrect input!", alertMessage: warning)
        } else {
            self.performSegue(withIdentifier: "continueRegistration", sender: self)
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
