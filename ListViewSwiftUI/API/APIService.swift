//
//  APIService.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 7.02.2024.
//

import Foundation
enum APIError: Error {
    case urlSessionError(String)
    case serverError(String = "INVALID API KEY")
    case invalidResponse(String = "Invalid error from server")
    case decodingError(String = "Errorparsing server response")
}

protocol Service {
    func makeRequest<T: Codable>(with request: URLRequest, completion: @escaping (T?,APIError?) -> Void)
}

class APIService: Service {
    func makeRequest<T: Codable>(with request: URLRequest, completion: @escaping (T?,APIError?) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(nil, .urlSessionError(error.localizedDescription))
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode > 299 {
                completion(nil, .serverError())
                return
            }
            
            guard let data else {
                completion(nil, .invalidResponse())
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                
            } catch {
                print(error)
                completion(nil,.decodingError())
                return
            }
        }
    }
}
