//
//  WelcomeView.swift
//  Menu
//
//  Created by Mohcine BELARREM on 24/12/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack() {
            Image("littleOrange")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Welcome to the Moroccan restaurant Little Orange menu app.")
                .multilineTextAlignment(.center)
                .font(.custom("Futura", size: 20))
                .padding()
            Spacer()
            
            Button {
                UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            } label: {
                Text("Get Started")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.custom("Futura", size: 20))
                    .foregroundColor(.white)
            }
            .background(Color.littleOrange)
            .cornerRadius(10)
            .padding()

        }
        .padding()
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
