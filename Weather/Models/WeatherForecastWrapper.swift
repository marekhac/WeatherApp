//
//  WeatherForecastWrapper.swift
//  Weather
//
//  Created by Marek Hac on 11/06/2024.
//

struct WeatherForecastWrapper  {
    var time: String?
    var code: Int?
    var maxTemperature: Float?
    
    var maxTemperatureFullText: String {
        guard let temperature = maxTemperature else { return "Not Available"}
        return String(temperature) + "°C"
    }
}
