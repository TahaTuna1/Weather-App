//
//  CityTextView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct CityTextView: View { //MARK: City Name View and Theme Switcher
    var cityName: String
    @Binding var imageIndex: Int
    
    var body: some View{
        HStack{
            Image(systemName: "chevron.left")
                .foregroundColor(.offWhite)
                .padding(.leading, 30)
                .font(.system(size: 30))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                .onTapGesture {
                    if imageIndex > 0 {
                        imageIndex -= 1
                    }
                }
            
            Spacer()
            
            Text(cityName).font(.system(size: 30, weight: .light, design: .default))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                .foregroundColor(.offWhite)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.offWhite)
                .padding(.trailing, 30)
                .font(.system(size: 30))
                .shadow(color: .offBlack, radius: 0, x: 2, y: 2)
                .onTapGesture {
                    if imageIndex < BG.allImages.count - 1{
                        imageIndex += 1
                    }
                }
        }.padding(.top, 10)
            
        
    }
}
