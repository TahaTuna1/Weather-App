//
//  WeatherApp.swift
//  Weather
//
//  Created by Taha Tuna on 5.02.2023.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            //            TestView(viewModel: viewModel)
            WeatherView(viewModel: viewModel)
        }
    }
}
