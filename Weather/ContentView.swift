//
//  ContentView.swift
//  Weather
//
//  Created by Taha Tuna on 5.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack{
                
                BackgroundView(image: "sunset2")// Background Image
                
                VStack{ //MARK: Top Navigation Buttons - City Name
                    
                    CityTextView(cityName: "Istanbul")
                    
                    Spacer()
                    
                    //Large Temperature View
                    MainWeatherStatusView(imageName: "sun.dust", temp: "12°")
                    
                    Spacer()
                    
                    
                    //Location Selection Button
                    Button {
                        print("pressed")
                    } label: {
                        LocationButtonView(icon: "location")
                    }.offset(x: 120, y:70)
                    
                }
            }
            
            Spacer()
            
            VStack { //MARK: Buttom View
                
                HStack{
                    Text("Sunday") //Day
                        .font(.title)
                        .foregroundColor(.offBlack)
                    Spacer()
                    Text("Istanbul, TR") // City and country code
                        .font(.title2)
                        .foregroundColor(.offBlack)
                }
                .padding(EdgeInsets(top: 70, leading: 20, bottom: 25, trailing: 20))
                
                HStack(spacing: 25){// Weekly Forecast View
                    
                    WeatherDayView(dayOfWeek: "MON", dayIcon: "cloud.rain", dayDegree: "-3°")
                    WeatherDayView(dayOfWeek: "TUE", dayIcon: "sun.dust", dayDegree: "5°")
                    WeatherDayView(dayOfWeek: "WED", dayIcon: "cloud.sun.rain", dayDegree: "-1°")
                    WeatherDayView(dayOfWeek: "THU", dayIcon: "cloud.bolt", dayDegree: "4°")
                    WeatherDayView(dayOfWeek: "FRI", dayIcon: "cloud.snow", dayDegree: "2°")
                }
            }
            
            Spacer()
            
            //MARK: Add LastUpdateView
            
        }.background(Color.offWhite)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
