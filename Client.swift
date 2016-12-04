//
//  Client.swift
//  ToTheResort
//
//  Created by Булат Галиев on 01.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import Foundation

protocol Parser {
    func parse(response: AnyObject?)
}

class Client {
    var parserDelegate: Parser!
    func getTourPackages() {
        // connect to server and parse result and get result
        let response = Dictionary<String, AnyObject>()
        parserDelegate.parse(response: response as AnyObject?)
    }
    
    func getTourPackages(parametersDictionary: [String : Any]) {
        // connect to server and parse result
        // send post request to server and get result
        let response = Dictionary<String, AnyObject>()
        parserDelegate.parse(response: response as AnyObject?)
    }
}
