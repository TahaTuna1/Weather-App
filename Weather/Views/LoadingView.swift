//
//  LoadingView.swift
//  Weather
//
//  Created by Taha Tuna on 29.04.2023.
//


import SwiftUI


struct LoadingView: View{
    var body: some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .orange))
    }
}
