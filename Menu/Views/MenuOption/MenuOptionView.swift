//
//  MenuOptionView.swift
//  Menu
//
//  Created by Mohcine BELARREM on 23/12/2023.
//

import SwiftUI

struct MenuOptionView: View {
    let imageName: String
    let optionName: String
    var isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack() {
                Image(systemName: imageName)
                Text(optionName)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct MenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionView(imageName: "image", optionName: "option", isSelected: true, action: {
            print("bla bla")
        })
    }
}
