//
//  People.swift
//  DiaffableTutorial
//
//  Created by James Rochabrun on 6/23/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct People: Decodable {
    
    var name: String?
    var birthYear: String?
    var eyeColor: String?
    var gender: String?
    var hairColor: String?
    var height: String?
    var mass: String?
    var skinColor: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var url: String?
    var created: String?
    var edited: String?
    

}

extension People: Hashable {
    
    // satisfy hash
    var identifier: UUID {
        return UUID()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
