//
//  BackgroundView.swift
//  Weather
//
//  Created by Taha Tuna on 27.04.2023.
//

import SwiftUI

struct BackgroundView: View { //MARK: Background Image View
    var body: some View {
        
        Image("sunset2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
