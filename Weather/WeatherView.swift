//
//  WeatherView.swift
//  Weather
//
//  Created by Taha Tuna on 5.02.2023.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack{
            ZStack{
                
                BackgroundView(image: BG.lakeHouse)// Background Image
                
                VStack{ //MARK: Top Navigation Buttons - City Name
                    
                    CityTextView(cityName: viewModel.cityName)
                    
                    
                    Spacer()
                    
                    //Large Temperature View
                    MainWeatherStatusView(description: viewModel.weatherDescription, temp: viewModel.temperature)
                    
                    Spacer()
                    
                    
                    //Location Selection Button
                    Button {
                        viewModel.refresh()
                    } label: {
                        
                        LocationButtonView(icon: "location")
                    }.offset(x: 0, y: 90)
                    
                }
                if viewModel.isLoading{
                    ProgressView().scaleEffect(3)
                }
            }
            
            Spacer()
            
            ZStack {
                VStack { //MARK: Buttom View
                    
                    HStack{
                        Text("Today") //Day
                            .font(.title)
                            .foregroundColor(.offBlack)
                        Spacer()
                        Text(viewModel.cityName) // City and country code
                            .font(.title2)
                            .foregroundColor(.offBlack)
                    }
                    .padding(EdgeInsets(top: 70, leading: 20, bottom: 25, trailing: 20))
                    
                    HStack(spacing: 25) { // Create 5 hourly views
                        
                        ForEach(viewModel.fiveForecast.prefix(5), id: \.date) { day in
                            
                            let timeString = viewModel.formatDate(day.date, format: "HH:mm")
                            WeatherDayView(
                                time: timeString,
                                dayIcon: WeatherIcon.getIcon(for: day.description),
                                dayDegree: day.temperature)
                            
                        }
                    }

                }.blur(radius: viewModel.isLoading ? 5 : 0) // Blur and Load if isLoading
                if viewModel.isLoading{
                    ProgressView().scaleEffect(3).offset(x: 0, y: 40)
                }
            }

            
            Spacer()
            
            //MARK:  LastUpdateView
            Text("Last Update \(viewModel.lastUpdated)")
                .font(.footnote)
                .foregroundColor(.black)
                .opacity(0.2)
                .padding(0)
        }
        .background(Color.offWhite)
        .onAppear(perform: viewModel.refresh)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
