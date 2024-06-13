//
//  Place.swift
//  Weather
//
//  Created by Marek Hac on 08/06/2024.
//

import Foundation

struct Place: Codable, Identifiable {
    var id: Int
    var displayName: String?
    var latitude: String?
    var longitude: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "osm_id"
        case displayName = "display_name"
        case latitude = "lat"
        case longitude = "lon"
    }
}
