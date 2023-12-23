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
