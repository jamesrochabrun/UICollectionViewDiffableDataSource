//
//  SwapiEndpoint.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

enum SwapiEndpoint {
    
    case people(_ id: String?, query: String?)
    case films(_ id: String?, query: String?)
    case planets(_ id: String?, query: String?)
    case species(_ id: String?, query: String?)
    case starships(_ id: String?, query: String?)
    case vehicles(_ id: String?, query: String?)
}

extension SwapiEndpoint: Endpoint {
    
    var base: String {
        return "https://swapi.co"
    }
    
    var path: String {
        switch self {
        case .people(let id, _): return "/api/people/\(id ?? "")"
        case .films(let id, _): return "/api/films/\(id ?? "")"
        case .planets(let id, _): return "/api/planets/\(id ?? "")"
        case .species(let id, _): return "/api/species/\(id ?? "")"
        case .starships(let id,_): return "/api/starships/\(id ?? "")"
        case .vehicles(let id, _): return "/api/vehicles/\(id ?? "")"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var q = ""
        switch self {
        case .people(_, let query):
            q = query ?? ""
        case .films(_, let query):
            q = query ?? ""
        case .planets(_, let query):
            q = query ?? ""
        case .species(_, let query):
            q = query ?? ""
        case .starships(_, let query):
            q = query ?? ""
        case .vehicles(_, let query):
            q = query ?? ""
        }
        return [URLQueryItem(name: "search", value: q)]
    }
    
    init?(T: Decodable.Type, id: String?, query: String?) {
        switch T {
        case is Film.Type: self = .films(id, query: query)
        case is People.Type: self = .people(id, query: query)
        case is Starship.Type: self = .starships(id, query: query)
        case is Vehicle.Type: self = .vehicles(id, query: query)
        case is Species.Type: self = .species(id, query: query)
        case is Planet.Type: self = .planets(id, query: query)
        default: return nil
        }
    }
}
