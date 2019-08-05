//
//  Endpoint.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base:  String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url! //want to crash if no information is complete
        return URLRequest(url: url)
    }
}
