//
//  PlaceItemView.swift
//  Weather
//
//  Created by Marek Hac on 09/06/2024.
//

import SwiftUI

struct PlaceItemView: View {
    @State private var isActive = false
    var place: Place
    
    var body: some View {
        HStack(alignment: .center) {
            Text(place.displayName ?? "")
                .font(.subheadline)
        }
        .navigationDestination(isPresented: $isActive) {
            WeatherForecastView(place: place)
        }
        .onTapGesture {
            isActive.toggle()
        }
    }
}
