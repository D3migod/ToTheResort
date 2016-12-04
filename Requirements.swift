//
//  Requirements.swift
//  ToTheResort
//
//  Created by Булат Галиев on 04.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import Foundation

protocol RequirementsSaver {
    func saveRequirements(_ requirements: Requirements)
}

struct Requirements {
    let leavingDate: Date
    let arrivalDate: Date
    let numberOfPlaces: Int
}
