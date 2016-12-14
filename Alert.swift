//
//  Alert.swift
//  ToTheResort
//
//  Created by Булат Галиев on 14.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//


import UIKit

class Alert: NSObject {
    func showAlertMessage(showingViewController: UIViewController, alertTitle: String, alertMessage: String)
    {
        let alert = UIAlertController(title:alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(ok)
        showingViewController.present(alert, animated: true, completion: nil)
    }
}
