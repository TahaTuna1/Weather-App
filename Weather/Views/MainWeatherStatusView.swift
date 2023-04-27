//
//  MainWeatherStatusView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct MainWeatherStatusView: View { //MARK: Large Temperature View
    var imageName: String
    var temp: String
    
    var body: some View {
            Text(temp)
            .foregroundColor(.offWhite)
                .shadow(color: .offBlack, radius: 0, x: 5, y: 5)
                .font(.system(size: 130, weight: .bold))
                
                
    }
}


struct MainWeatherStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherStatusView(imageName: "sun.dust", temp: "28°")
    }
}
