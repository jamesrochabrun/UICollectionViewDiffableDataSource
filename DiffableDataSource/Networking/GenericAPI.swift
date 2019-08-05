//
//  GenericAPI.swift
//  DiffableDataSource
//
//  Created by James Rochabrun on 8/4/19.
//  Copyright © 2019 James Rochabrun. All rights reserved.
//

import Foundation

protocol GenericAPI {
    
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void)
}

extension GenericAPI {
    
    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    
    func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(description: error.debugDescription))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let genericModel = try decoder.decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch let error {
                        completion(nil, .jsonConversionFailure(description: error.localizedDescription))
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful(description: "status code = \(httpResponse.statusCode)"))
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            
            //MARK: change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
}
