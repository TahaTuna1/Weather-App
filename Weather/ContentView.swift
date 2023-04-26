//
//  ContentView.swift
//  Weather
//
//  Created by Taha Tuna on 5.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Istanbul, TR")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.dust.fill",
                                      temp: "-3°")
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "MON", dayIcon: "cloud.snow.fill", dayDegree: "-3°")
                    WeatherDayView(dayOfWeek: "TUE", dayIcon: "cloud.heavyrain.fill", dayDegree: "5°")
                    WeatherDayView(dayOfWeek: "WED", dayIcon: "sun.dust.fill", dayDegree: "-1°")
                    WeatherDayView(dayOfWeek: "THU", dayIcon: "cloud.rain.fill", dayDegree: "4°")
                    WeatherDayView(dayOfWeek: "FRI", dayIcon: "cloud.fill", dayDegree: "2°")
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: isNight ? .black : .cyan, backgroundColor: isNight ? .offWhite : .offWhite)
                }
                Spacer()
                
                
                //MARK: Add LastUpdateView

            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: Move the following views into separate View files

struct WeatherDayView: View {
    var dayOfWeek: String
    var dayIcon: String
    var dayDegree: String
    
    var body: some View {
        VStack{
            
            
            Text(dayOfWeek)
                .foregroundColor(.offWhite)
                .font(.system(size: 25, weight: .medium))
            
            Image(systemName: dayIcon)
                .symbolRenderingMode(.monochrome)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                .foregroundColor(.offWhite)
            
            Text(dayDegree).foregroundColor(.offWhite)
                .font(.system(size: 30, weight: .medium))
        }
    }
}

struct BackgroundView: View { //MARK: Background Gradient. Make it better
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        // CUSTOM GOOD GRADIENT
        LinearGradient(gradient: Gradient(
            colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        
        //APPLE'S DEFAULT EASY GRADIENT
//        ContainerRelativeShape()
//            .fill(isNight ? Color.cyan.gradient : Color.black.gradient)
//            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.offWhite)
            .padding(20)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .foregroundColor(.offWhite)
            
            Text(temp).foregroundColor(.offWhite)
                .font(.system(size: 80, weight: .medium))
            
        }.padding(50)
    }
}


