//
//  WeatherForecastViewModel.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import Foundation

@Observable
class WeatherForecastViewModel {
    private var networkController = NetworkManager()
    var weather: [WeatherForecastWrapper] = []
    var weatherTypes: [String: WeatherType] = [:]
    
    init() {
        weatherTypes = convertJSONToWeatherTypes()
    }
    
    @MainActor
    func getWeatherForecast(for place: Place) async {
        let foundWeather = try? await networkController.getWeatherForecast(for: place)
        if let foundWeather {
            weather = foundWeather
        }
    }
    
    func convertJSONToWeatherTypes() -> [String : WeatherType] {
        if let path = Bundle.main.path(forResource: "weather", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return try JSONDecoder().decode([String: WeatherType].self, from: jsonData)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        return [:]
    }
}
