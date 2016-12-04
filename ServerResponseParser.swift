//
//  ServerResponseParser.swift
//  ToTheResort
//
//  Created by Булат Галиев on 01.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import Foundation

class ServerResponseParser: Parser {
    var client = Client()
    
    init() {
        client.parserDelegate = self
    }
    
    func getTourPackages() {
        client.getTourPackages()
    }
    
    func localDateToUTC(_ date: Date?) -> String? {
        if date == nil {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return dateFormatter.string(from: date!)
    }
    
    func UTCToLocal(_ timeString: String?) -> String? {
        if timeString == nil {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
        dateFormatter.timeZone = NSTimeZone.local
        let date = dateFormatter.date(from: timeString!)
        return dateFormatter.string(from: date!)
    }
    
    func getTourPackages(requirements: Requirements) {
        let parametersDictionary = ["arrival_date": localDateToUTC(requirements.arrivalDate)!, "leaving_date": localDateToUTC(requirements.leavingDate)!, "number_of_places": requirements.numberOfPlaces] as [String : Any]
        client.getTourPackages(parametersDictionary: parametersDictionary)
    }
    
    func parse(response: AnyObject?) {
//        That is how it should be done
//        let tourPackages = response as? Dictionary<String, AnyObject>
//        Then parse response
        let tourPackages = createTourPackages(containing: 10)
        let dataDict:[String: Array<TourPackage>] = ["tourPackages": tourPackages]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ReceivedTourPackages"), object: self, userInfo: dataDict)
    }
}
