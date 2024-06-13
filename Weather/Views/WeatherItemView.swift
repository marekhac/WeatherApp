//
//  WeatherForecastItemView.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import SwiftUI

struct WeatherItemView: View {
    var weather: WeatherForecastWrapper
    var weatherType: WeatherType?
    
    var body: some View {
        VStack(alignment: .center) {
            time
            weatherImage
            temperature
        }
    }
    
    var time: some View {
        Text(weather.time ?? "")
            .padding(8)
            .background(.cyan)
            .cornerRadius(10)
    }
    
    var weatherImage: some View {
        AsyncImage(url: URL(string: weatherType?.day.image ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
    
    var temperature: some View {
        Text(weather.maxTemperatureFullText)
            .padding(8)
            .background(.orange)
            .cornerRadius(10)
    }
}
