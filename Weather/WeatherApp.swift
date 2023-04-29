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
//            WeatherView()
            let weatherService = WeatherService()
            let viewModel = WeatherTestViewModel(weatherService: weatherService)
            TestView(viewModel: viewModel)
        }
    }
}
