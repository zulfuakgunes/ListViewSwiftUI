//
//  Endpoints.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 7.02.2024.
//

import Foundation

enum Endpoints {
    case fetchPosts(url: String = "/posts")
    case fetchOnePosts(url: String = "/posts", postId: Int = 1)
    case sendPosts(url: String = "/posts", post: Posts)
    
    var request: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.httpBody = self.httpBody
        request.addValues(for: self)
        return request
    }
    
    private var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        components.queryItems = self.queryItems
        return components.url
    }

    private var path: String {
        switch self {
        case .fetchPosts(let url):
            return url
        case .fetchOnePosts(let url, let postId):
            return "\(url)/\(postId.description)"
        case .sendPosts(let url, let post):
            return url
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        default: return []
        }
    }
    
    private var httpMethod: String? {
        switch self {
        case .fetchPosts, .fetchOnePosts:
            return HTTP.Method.get.rawValue
        case .sendPosts(_, let post):
            return HTTP.Method.post.rawValue
        }
    }
    
    private var httpBody: Data? {
        switch self {
        case .fetchPosts, .fetchOnePosts:
            return nil
        case .sendPosts(_, let post):
            let jsonPost = try? JSONEncoder().encode(post)
            return jsonPost
        }
    }
    
}

extension URLRequest {
    mutating func addValues(for endpoint:Endpoints) {
        switch endpoint {
        case .fetchPosts, .fetchOnePosts:
            break
        case .sendPosts(let url, let post):
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue,
                          forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
