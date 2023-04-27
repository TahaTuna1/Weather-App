//
//  CityTextView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct CityTextView: View { //MARK: City Name View
    var cityName: String
    var body: some View{
        HStack{
            Image(systemName: "gear") //Settings
                .foregroundColor(.offWhite)
                .padding(.leading, 30)
                .font(.system(size: 30))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
            
            Spacer()
            
            Text(cityName).font(.system(size: 30, weight: .light, design: .default))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                .foregroundColor(.offWhite)
            
            Spacer()
            
            Image(systemName: "paintpalette") // Theme Selector
                .foregroundColor(.offWhite)
                .padding(.trailing, 30)
                .font(.system(size: 30))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
        }.padding(.top, 10)
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView(cityName: "Istanbul").padding(.top, 10)
    }
}
