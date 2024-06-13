//
//  SearchCityView.swift
//  Weather
//
//  Created by Marek Hac on 08/06/2024.
//

import SwiftUI

struct SearchCityView: View {
    @State private var city: String = ""
    @State var viewModel = SearchCityViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                cityTextField
                searchButton
                Divider()
            
                if viewModel.isLoading {
                    centeredProgressView
                } else {
                    scrollViewWithPlaces
                }
                
                Spacer()
            }
            .navigationBarTitle("Weather App")
            .padding(.horizontal, 20)
            .padding(.top, 60)
        }
    }
    
    var cityTextField: some View {
        TextField("Put city name and press search  button", text: $city)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
    
    var searchButton: some View {
        Button(action: {
            Task {
                await viewModel.search(for: city)
            }
        }) {
            Text("Search")
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 18))
                .padding()
                .foregroundColor(.white)
        }
        .background(Color.orange)
        .cornerRadius(25)
    }
    
    var centeredProgressView: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }.padding(.top, 40)
    }
    
    var scrollViewWithPlaces: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.foundPlaces, id: \.id) { place in
                    PlaceItemView(place: place)
                    Divider()
                }
            }
        }
    }
}
