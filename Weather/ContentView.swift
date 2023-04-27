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
                
                Image("sunset2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(height: 400)
                
                VStack{
                    CityTextView(cityName: "Istanbul").padding(.top, 10)
                    
                    Spacer()
                    
                    MainWeatherStatusView(imageName: "sun.dust", temp: "28°")
                    
                    Spacer()
                    
                    Button {
                        //2
                    } label: {
                        
                        ZStack {
                            Circle().foregroundColor(.offWhite)
                                .frame(width: 60, height: 60)
                                .shadow(color: .black, radius: 0, x: 3, y: 3)
                            
                            Image(systemName: "location")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }.offset(x: 120, y:70)

                    
                }
                
            }
            
            Spacer()
            
            VStack {
                
                HStack{
                    Text("Today")
                        .font(.title)
                    Spacer()
                    Text("Istanbul, TR")
                        .font(.title2)
                }
                .padding(EdgeInsets(top: 70, leading: 20, bottom: 25, trailing: 20))
                
                HStack(spacing: 25){
                    
                    WeatherDayView(dayOfWeek: "MON", dayIcon: "cloud.rain", dayDegree: "-3°")
                    WeatherDayView(dayOfWeek: "TUE", dayIcon: "cloud.rain", dayDegree: "5°")
                    WeatherDayView(dayOfWeek: "WED", dayIcon: "cloud.rain", dayDegree: "-1°")
                    WeatherDayView(dayOfWeek: "THU", dayIcon: "cloud.rain", dayDegree: "4°")
                    WeatherDayView(dayOfWeek: "FRI", dayIcon: "cloud.rain", dayDegree: "2°")
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


//MARK: Move the following views into separate View files

struct WeatherDayView: View {
    var dayOfWeek: String
    var dayIcon: String
    var dayDegree: String
    
    var body: some View {
        VStack{
            
            
            Text(dayOfWeek)
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .light))
            
            
            Image(systemName: dayIcon)
                .symbolRenderingMode(.monochrome)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
                .foregroundColor(.black)
                .fontWeight(.light)
                
            Text(dayDegree).foregroundColor(.black)
                .font(.system(size: 25, weight: .light))
        }
    }
}

struct BackgroundView: View { //MARK: Background Gradient. Make it better
    
    
    
    var body: some View {
        
        Image("sunset2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName).font(.system(size: 40, weight: .light, design: .default))
            .shadow(color: .black, radius: 0, x: 2, y: 2)
            .foregroundColor(.offWhite)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: String
    
    var body: some View {
        VStack{
            
            Text(temp).foregroundColor(.offWhite)
                .font(.system(size: 130, weight: .bold))
                .offset(x: 20)
            
//            Image(systemName: imageName)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 40, height: 40)
//                .foregroundColor(.offWhite)
                
            
        }.shadow(color: .black, radius: 0, x: 5, y: 5)
    }
}


