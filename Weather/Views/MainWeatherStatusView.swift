//
//  MainWeatherStatusView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct MainWeatherStatusView: View { //MARK: Large Temperature View
    var description: String
    var temp: String
    
    var body: some View {
        ZStack {
            VStack{
                Text(temp)
                    .foregroundColor(.offWhite)
                    .shadow(color: .offBlack, radius: 0, x: 5, y: 5)
                    .font(.system(size: 130, weight: .bold))
                Text(description)
                    .foregroundColor(.offWhite)
                    .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                    .font(.title)
                    .fontWeight(.medium)
            }
            
                    
        }
        
    }
}


struct MainWeatherStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherStatusView(description: "?Sunny?", temp: "28°")
    }
}
