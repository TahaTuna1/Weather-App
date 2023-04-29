//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Taha Tuna on 29.04.2023.
//

import Foundation

private let defaultIcon = "?"
struct WeatherIcon {
    private static let iconMap = [
        "rain" : "cloud.rain",
        "drizzle" : "cloud.rain",
        "thunder" : "cloud.bolt.rain",
        "clear sky" : "sun.min",
        "clouds" : "cloud",
        "snow" : "cloud.snow",
        "sunny" : "sun.max",
        "tornado" : "tornado",
        "mist" : "cloud.fog",
        "smoke" : "cloud.fog",
        "haze" : "cloud.sun",
        "dust" : "cloud.fog",
        "fog" : "cloud.fog",
        "sand" : "cloud.fog",
        "ash" : "cloud.fog",
        "squall" : "cloud.fog",
    ]
    
    static func getIcon(for description: String) -> String {
        for (key, value) in iconMap {
            if description.lowercased().contains(key.lowercased()) {
                return value
            }
        }
        return "sun.max.trianglebadge.exclamationmark.fill"
    }
}



public class WeatherViewModel: ObservableObject{
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    @Published var fiveForecast: [(date: Date, temperature: String, description: String)] = [(Date(), "--", "--")]
    @Published var followingHours: [String] = ["00:00"]
    @Published var isLoading = true
    @Published var lastUpdated: String = ""
    
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService){
        self.weatherService = weatherService
    }
    
    public func refresh(){
        
        weatherService.loadWeatherData{ weather in
            
            DispatchQueue.main.async {
                self.isLoading = true
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)°"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = WeatherIcon.getIcon(for: weather.description)
                
                self.fiveForecast = weather.firstFiveDays
                self.lastUpdated = Date().formatted()
                self.isLoading = false
            }
        }
        
    }
    
    
    func formatDate(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    
    
}
