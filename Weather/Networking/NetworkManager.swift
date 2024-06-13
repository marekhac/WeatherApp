//
//  NetworkManager.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

class NetworkManager {
    func buildURLRequest(_ host: String, _ path: String, _ parameters: [String:Any]) -> URLRequest
    {
        let urlString = host + path
        var urlComponents = URLComponents(string: urlString)!
        
        if !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems!.append(queryItem)
            }
        }
        
        let url = urlComponents.url!
        var request = NSMutableURLRequest(url: url) as URLRequest
        request.httpMethod = "GET"
        
        if let url = request.url {
           print("[NETWORK] Request to URL: \(url)")
        }
        
        return request as URLRequest
    }

    func get(request: URLRequest) async throws -> Data? {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
