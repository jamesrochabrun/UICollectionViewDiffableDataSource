//
//  Film.swift
//  DiaffableTutorial
//
//  Created by James Rochabrun on 6/23/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

struct Film: Decodable, Hashable {
    
    let title: String?
    let episodeId: Int?
    let openingCrawl: String?
    let director: String?
    let producer: String?
    let releaseDate: String?
    let species: [String]?
    let starships: [String]
    let vehicles: [String]?
    let characters: [String]?
    let planets: [String]?
    let url: String?
    let created: String?
    let edited: String?
}


