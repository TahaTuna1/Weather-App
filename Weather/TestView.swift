//
//  TestView.swift
//  Weather
//
//  Created by Taha Tuna on 29.04.2023.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var viewModel: WeatherTestViewModel
    var body: some View {
        VStack{
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            
            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()
            
            Text(viewModel.weatherIcon)
                .font(.system(size: 70))
                .padding()
            
            Text(viewModel.weatherDescription)
        }.onAppear(perform: viewModel.refresh)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(viewModel: WeatherTestViewModel(weatherService: WeatherService()))
    }
}
