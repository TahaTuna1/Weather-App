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
                
                Image("sunset2") //Background Image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(height: 400)
                
                VStack{ //MARK: Top Navigation Buttons - City Name
                    HStack {
                        Image(systemName: "gear") //Settings
                            .foregroundColor(.offWhite)
                            .padding(.leading, 30)
                            .font(.system(size: 30))
                            .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                        
                        Spacer()
                        
                        CityTextView(cityName: "Istanbul").padding(.top, 10)
                        
                        Spacer()
                        
                        Image(systemName: "paintpalette") // Theme Selector
                            .foregroundColor(.offWhite)
                            .padding(.trailing, 30)
                            .font(.system(size: 30))
                            .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                    }
                    
                    Spacer()
                    //Large Temperature View
                    MainWeatherStatusView(imageName: "sun.dust", temp: "12°")
                    
                    Spacer()
                    
                    //Location Selection Button
                    Button {
                        //button function
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
                    Spacer()
                    Text("Istanbul, TR") // City and country code
                        .font(.title2)
                }
                .padding(EdgeInsets(top: 70, leading: 20, bottom: 25, trailing: 20))
                
                HStack(spacing: 25){ // Weekly Forecast View
                    
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








