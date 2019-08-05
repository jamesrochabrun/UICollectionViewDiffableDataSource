//
//  Resources.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

public struct Resources<T: Decodable>: Resource {
    
    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
}
protocol Resource: Decodable {
    
    associatedtype T
    var count: Int? { get }
    var next: String? { get }
    var previous: String? { get }
    var results: [T]? { get }
}
