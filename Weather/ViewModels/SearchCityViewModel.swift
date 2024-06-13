//
//  SearchCityViewModel.swift
//  Weather
//
//  Created by Marek Hac on 08/06/2024.
//

import Foundation

@Observable
class SearchCityViewModel {
    var isLoading: Bool = false
    var foundPlaces: [Place] = []
    private var networkController = NetworkManager()

    @MainActor
    func search(for city: String) async {
        isLoading = true
        do {
            let places = try await networkController.getPlaces(for: city)
            if let places {
                foundPlaces = places
                isLoading = false
            }
        } catch {
            isLoading = false
        }
    }
}
