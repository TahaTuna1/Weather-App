//
//  WeatherDayView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct WeatherDayView: View { //MARK: Small Weather Daily Forecast View
    var time: String
    var dayIcon: String
    var dayDegree: String
    
    var body: some View {
        VStack{
            Text(time)
                .foregroundColor(.offBlack)
                .font(.system(size: 20, weight: .light))
            
            Image(systemName: dayIcon)
                .symbolRenderingMode(.monochrome)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .foregroundColor(.offBlack)
                .fontWeight(.light)
                
            
            
            Text(dayDegree).foregroundColor(.offBlack)
                .font(.system(size: 25, weight: .light))
        }
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayView(time: "00:00", dayIcon: "cloud.rain", dayDegree: "-3°")
    }
}
