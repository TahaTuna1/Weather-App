//
//  LocationButtonView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct LocationButtonView: View { //MARK: Location Selection Button
    var icon: String
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.offWhite)
                .cornerRadius(20)
                .frame(width: 60, height: 60)
                .shadow(color: .offBlack, radius: 0, x: 3, y: 3)
            
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.offBlack)
        }
    }
}

struct LocationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LocationButtonView(icon: "location")
    }
}
