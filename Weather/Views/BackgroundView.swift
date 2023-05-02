//
//  BackgroundView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct BackgroundView: View { //MARK: Background Image View
    var image: String
    var body: some View {
        
        Image(image) //Background Image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .frame(height: 400)
            
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(image: "sunsetist")
    }
}
