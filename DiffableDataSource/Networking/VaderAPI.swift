//
//  VaderAPI.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

class VaderAPI: GenericAPI {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    public convenience init() {
        self.init(configuration: .default)
    }
    
    private func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T?, APIError>) -> Void) {
        fetch(with: request, decode: { json -> T? in
            guard let resource = json as? T else { return nil }
            return resource
        }, completion: completion)
    }
    
    public func get<T: Resource>(_ value: T.Type, completion: @escaping (Result<T?, APIError>) -> Void) {
        
        guard let decodedAssociatedType = value.T.self as? Decodable.Type else { return }
        guard let resource = SwapiEndpoint(T: decodedAssociatedType, id: nil, query: nil) else { return }
        let request = resource.request
        self.fetch(with: request, completion: completion)
    }
    
    public func search<T: Decodable>(_ value: T.Type, withID id: String, completion: @escaping (Result<T?, APIError>) -> Void)  {
        
        guard let resource = SwapiEndpoint(T: value, id: id, query: nil) else { return }
        let request = resource.request
        self.fetch(with: request, completion: completion)
    }
    
    public func search<T: Resource>(_ value: T.Type, query: String, completion: @escaping (Result<T?, APIError>) -> Void)  {
        
        guard let decodedAssociatedType = value.T.self as? Decodable.Type else { return }
        guard let resource = SwapiEndpoint(T: decodedAssociatedType, id: nil, query: query) else { return }
        let request = resource.request
        self.fetch(with: request, completion: completion)
    }
}
