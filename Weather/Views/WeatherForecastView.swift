//
//  WeatherForecastView.swift
//  Weather
//
//  Created by Marek Hac on 08/06/2024.
//

import SwiftUI

struct WeatherForecastView: View {
    var place: Place
    @State var viewModel = WeatherForecastViewModel()
    var body: some View {
        VStack(alignment: .center) {
            horizontalScrollViewWithForecast
            title
            placeName
            Spacer()
        }
        .padding()
        .task {
            await viewModel.getWeatherForecast(for: place)
        }
    }
    
    var horizontalScrollViewWithForecast: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(viewModel.weather, id: \.time) { weather in
                    WeatherItemView(weather: weather,
                                    weatherType: viewModel.weatherTypes[String(weather.code ?? 0)])
                    .padding(20)
                    
                }
            }
        }
        .padding(.bottom, 30)
        .frame(height: 300)
    }
    
    var title: some View {
        Text("Weather forecast for:")
            .font(.title)
    }
    
    var placeName: some View  {
        Text(place.displayName ?? "")
            .padding()
    }
}
