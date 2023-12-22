//
//  MenuItemGridView.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import SwiftUI

struct MenuItemGridView: View {
    private var item: MenuItem
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.imageName ?? "")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(25)
            Text(item.name)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .font(.custom("Futura", size: 14))
                .fontWeight(.regular)
            Spacer()
        }
        .frame(height: 200)
        .padding([.top,.trailing], 10)
    }
    
    init(item: MenuItem) {
        self.item = item
    }
}

struct MenuItemGridView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemGridView(item: .init(id: "12", price: 12.4, name: "Some Name", menuCategory: .dessert, imageName: "couscous", ordersCount: 12, ingredients: []))
    }
}
