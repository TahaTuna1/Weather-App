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
        Text(cityName).font(.system(size: 40, weight: .light, design: .default))
            .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
            .foregroundColor(.offWhite)
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView(cityName: "Istanbul").padding(.top, 10)
    }
}
