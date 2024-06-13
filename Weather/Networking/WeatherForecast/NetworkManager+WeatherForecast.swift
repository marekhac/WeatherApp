//
//  NetworkManager+Forecast.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

extension NetworkManager {
    func getWeatherForecast(for place: Place) async throws -> [WeatherForecastWrapper]? {
                
        let host = "https://api.open-meteo.com/"
        let path = "v1/forecast"
        let parameters = ["daily": "weather_code,temperature_2m_max",
                          "timezone" : "Europe/Berlin",
                          "latitude" : place.latitude ?? "",
                          "longitude" : place.longitude ?? ""]
        
        let request = buildURLRequest(host, path, parameters)
        let data = try await get(request: request)
        guard let jsonData = data else { return nil }
        
        let decoder = JSONDecoder()
        let weatherForecast = try? decoder.decode(WeatherForecast.self, from: jsonData)
        
        let weatherForecastWrapper = weatherForecast?.daily?.time.enumerated().map { (index, element) in
            return WeatherForecastWrapper(time: element,
                                          code: weatherForecast?.daily?.weatherCode[index],
                                          maxTemperature: weatherForecast?.daily?.maxTemperature[index])
        }
        
        return weatherForecastWrapper
    }
}
