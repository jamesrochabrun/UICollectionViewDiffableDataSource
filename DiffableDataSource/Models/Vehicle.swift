//
//  Vehicle.swift
//  DiaffableTutorial
//
//  Created by James Rochabrun on 6/23/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct Vehicle: Decodable {
    
    var name: String?
    var model: String?
    var vehicleClass: String?
    var manufacturer: String?
    var length: String?
    var costInCredits: String?
    var crew: String?
    var passengers: String?
    var maxAtmospheringSpeed: String?
    var cargoCapacity: String?
    var consumables: String?
    var films: [String]?
    var pilots: [String]?
    var url: String?
    var created: String?
    var edited: String?
}
