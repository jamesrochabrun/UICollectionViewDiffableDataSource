//
//  Planet.swift
//  DiaffableTutorial
//
//  Created by James Rochabrun on 6/23/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct Planet: Decodable {
    
    var name: String?
    var diameter: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var gravity: String?
    var population: String?
    var climate: String?
    var terrain: String?
    var surfaceWater: String?
    var residents: [String]?
    var films: [String]?
    var url: String?
    var created:String?
    var edited: String?
}
