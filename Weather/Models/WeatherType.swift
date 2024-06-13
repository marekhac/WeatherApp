//
//  CurrentWeather.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

struct WeatherType: Codable {
    let day: WeatherTypeDetails
    let night: WeatherTypeDetails

    struct WeatherTypeDetails: Codable {
        let description: String
        let image: String
    }
}


