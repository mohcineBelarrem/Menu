//
//  GradientBackgroundView.swift
//  Menu
//
//  Created by Mohcine on 23/12/2023.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.gray1, .littleOrange], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView()
    }
}


extension Color {
    static var gray1: Color {
        return .init(red: 237.0/255.0, green: 234.0/255.0, blue: 233.0/255.0)
    }
    static var gray2: Color {
        return .init(red: 246.0/255.0, green: 243.0/255.0, blue: 242.0/255.0)
    }
}

