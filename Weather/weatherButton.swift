//
//  weatherButton.swift
//  Weather
//
//  Created by Taha Tuna on 5.02.2023.
//
import SwiftUI

struct WeatherButton: View { //MARK: Make it into a Location Change button
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View{
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
