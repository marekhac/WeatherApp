//
//  NetworkManager+Places.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

extension NetworkManager {
    func getPlaces(for city: String) async throws -> [Place]? {
           
        let host = "https://nominatim.openstreetmap.org/"
        let path = "search.php"
        let parameters = ["format": "jsonv2",
                          "limit" : "10",
                           "q" : city]
        
        let request = buildURLRequest(host, path, parameters)
        let data = try await get(request: request)
        guard let jsonData = data else { return nil }
                
        let decoder = JSONDecoder()
        let placesModel = try? decoder.decode([Place].self, from: jsonData)

        return placesModel
    }
}

