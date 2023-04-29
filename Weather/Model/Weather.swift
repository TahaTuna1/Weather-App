//
//  Weather.swift
//  Weather
//
//  Created by Taha Tuna on 29.04.2023.
//

import Foundation


public struct Weather {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    let firstFiveDays: [(date: Date, temperature: String, description: String)]
    
    
    init(list: APIList, cityName: String, firstFiveDays: [(date: Date, temperature: String, description: String)]) {
        city = cityName
        temperature = "\(Int(list.main.temp))"
        description = list.weather.first?.description ?? ""
        iconName = list.weather.first?.main ?? ""
        self.firstFiveDays = firstFiveDays
    }
}
