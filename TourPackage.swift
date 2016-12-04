//
//  TourPackage.swift
//  ToTheResort
//
//  Created by Булат Галиев on 30.11.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import Foundation

public extension Int {
    public static func random(_ lower: Int = 1, _ upper: Int = 24) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
}

public extension Double {
    public static func random(_ lower: Int = 1, _ upper: Int = 24) -> Double {
        return Double(Int.random(lower, upper))
    }
}

public extension Date {
    public static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }
    
}

public extension Array {
    public func randomItem() -> Element? {
        guard self.count > 0 else {
            return nil
        }
        
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

public struct Randomize {
    public static func randomPoint() -> String {
        let randomPoint = ["Sukhumi", "Yerevan", "Thimphu", "Suva", "Victoria", "Dublin", "Rome", "Riga", "Monrovia", "Lisbon", "New Delhi", "Jerusalem", "London"]
        return randomPoint.randomItem()!
    }
    public static func randomExcursionName() -> String {
        let randomAdjective = ["A Delightful", "A Great", "A Grand", "An Early", "A Special", "A Long", "An Interesting", "A Charming", "A Misty", ""]
        let randomObject = ["Glacier", "Wilderness", "Fjords", "Marine", "ATV", "Hike", "Kart", "Park"]
        let randomType = ["Expedition", "Adventure", "Cruise", "Flightseeing", "Exploration"]
        return "\(randomAdjective.randomItem()!) \(randomObject.randomItem()!) \(randomType.randomItem()!)"
    }
    public static func randomHotelName() -> String {
        let randomAdjective = ["Jade", "Tranquil", "Marina", "Gentle", "Royal", "Majestic", "Pleasant", "Spring", "Southern", ""]
        let randomObject = ["Lake", "Monarch", "Summit", "Breakwater", "Court", "Rockies", "Residence", "Beach"]
        let randomType = ["Resort & Spa", "Resort", "Hotel", "Motel"]
        return "\(randomAdjective.randomItem()!) \(randomObject.randomItem()!) \(randomType.randomItem()!)"
    }
    public static func randomProgram() -> String {
        let randomActivity = ["Snacks", "Activity", "Rest"]
        let activityListSize = Int.random(1, 7)
        var activityList = "1. \(randomActivity.randomItem()!)"
        if activityListSize > 1 {
            for activityNumber in 2...activityListSize {
                activityList+="\n\(activityNumber). \(randomActivity.randomItem()!)"
            }
        }
        return activityList
    }
    public static func randomAddress() -> String {
        let randomObject = ["Lake", "Monarch", "Summit", "Breakwater", "Court", "Rockies", "Residence", "Beach"]
        return "\(Int.random(1, 100)) \(randomObject.randomItem()!) Street)"
    }
    public static func randomDate() -> Date {
        return Date.random()
    }
    public static func randomHours() -> Int {
        return Int.random()
    }
}

class Flight {
    var departureDate: Date
    var departureDateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy, H:mm"
            return dateFormatter.string(from: departureDate)
        }
    }
    var departurePoint: String
    var arrivalDate: Date
    var arrivalDateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy, H:mm"
            return dateFormatter.string(from: arrivalDate)
        }
    }
    var arrivalPoint: String
    
    init(departureDate:Date, departurePoint: String, arrivalDate: Date, arrivalPoint: String) {
        self.departureDate = departureDate
        self.departurePoint = departurePoint
        self.arrivalDate = arrivalDate
        self.arrivalPoint = arrivalPoint
    }
    convenience init() {
        self.init(departureDate: Randomize.randomDate(), departurePoint: Randomize.randomPoint(), arrivalDate: Randomize.randomDate(), arrivalPoint: Randomize.randomPoint())
    }
}

class Transfer {
    var departureDate: Date
    var departureDateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/M/yyyy, H:mm"
            return dateFormatter.string(from: departureDate)
        }
    }
    var departurePoint: String
    var arrivalDate: Date
    var arrivalDateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/M/yyyy, H:mm"
            return dateFormatter.string(from: arrivalDate)
        }
    }
    var arrivalPoint: String
    init(departureDate:Date, departurePoint: String, arrivalDate: Date, arrivalPoint: String) {
        self.departureDate = departureDate
        self.departurePoint = departurePoint
        self.arrivalDate = arrivalDate
        self.arrivalPoint = arrivalPoint
    }
    convenience init() {
        self.init(departureDate: Randomize.randomDate(), departurePoint: Randomize.randomPoint(), arrivalDate: Randomize.randomDate(), arrivalPoint: Randomize.randomPoint())
    }
}

class Hotel {
    var name: String
    var address: String
    var numberOfPlaces: Int
    var numberOfPlacesString: String {
        get {
            return "\(numberOfPlaces)"
        }
    }
    var checkInDate: Date
    var checkOutDate: Date
    var dateRange: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            let checkInDateString = dateFormatter.string(from: checkInDate)
            let checkOutDateString = dateFormatter.string(from: checkOutDate)
            return "\(checkInDateString) - \(checkOutDateString)"
        }
    }
    init(name: String, address: String, numberOfPlaces: Int, checkInDate: Date, checkOutDate: Date) {
        self.name = name
        self.address = address
        self.numberOfPlaces = numberOfPlaces
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
    }
    convenience init() {
        self.init(name: Randomize.randomHotelName(), address: Randomize.randomAddress(), numberOfPlaces: Int.random(1, 300), checkInDate: Randomize.randomDate(), checkOutDate: Randomize.randomDate())
    }
}

class Excursion {
    var name: String
    var date: Date
    var dateString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            return dateFormatter.string(from: date)
        }
    }
    var place: String
    var duration: Int
    var durationString: String {
        get {
            return "\(duration) hours"
        }
    }
    var program: String
    init(name: String, date: Date, place: String, duration: Int, program: String) {
        self.name = name
        self.date = date
        self.place = place
        self.duration = duration
        self.program = program
    }
    convenience init() {
        self.init(name: Randomize.randomExcursionName(), date: Randomize.randomDate(), place: Randomize.randomPoint(), duration: Randomize.randomHours(), program: Randomize.randomProgram())
    }
}

func createTourPackages(containing n: Int) -> Array<TourPackage> {
    var tourPackages = Array<TourPackage>()
    for _ in 0..<n {
        tourPackages.append(TourPackage())
    }
    return tourPackages
}

class TourPackage {
    var booked: Bool
    var cost: Double
    var price: String {
        get {
            return "\(cost) \u{20BD}"
        }
    }
    var flight: Flight
    var transfer: Transfer
    var hotel: Hotel
    var excursion: Excursion
    var photoURL: String
    init(booked: Bool, cost: Double, flight: Flight, transfer: Transfer, hotel: Hotel, excursion: Excursion, photoURL: String) {
        self.booked = booked
        self.cost = cost
        self.flight = flight
        self.transfer = transfer
        self.hotel = hotel
        self.excursion = excursion
        self.photoURL = photoURL
    }
    convenience init() {
        self.init(booked: false, cost: Double.random(30000, 300000), flight: Flight(), transfer: Transfer(), hotel: Hotel(), excursion: Excursion(), photoURL: String(Int.random(0, 9)))
    }
}
