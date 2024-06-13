//
//  WeatherForecast.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

struct WeatherForecast: Codable {
    var daily: Daily?
    var latitude: Double?
    var longitude: Double?
    
    struct Daily: Codable {
        var time: [String]
        var weatherCode: [Int]
        var maxTemperature: [Float]
        
        private enum CodingKeys: String, CodingKey {
            case time
            case weatherCode = "weather_code"
            case maxTemperature = "temperature_2m_max"
        }
    }
}




