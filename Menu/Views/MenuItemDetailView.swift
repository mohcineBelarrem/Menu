//
//  MenuItemDetailView.swift
//  Menu
//
//  Created by Mohcine BELARREM on 23/12/2023.
//

import SwiftUI

struct MenuItemDetailView: View {
    private var item: MenuItem
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .bottom) {
                        Text(item.name)
                            .font(.custom("Futura", size: 20))
                            .fontWeight(.bold)
                        Spacer()
                        Text(item.price.withDollars)
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                    HStack() {
                        Image(systemName: "star.circle")
                            .foregroundColor(.yellow)
                        Text("\(item.ordersCount)")
                            .font(.custom("Futura", size: 12))
                    }
                    .padding(.top,-10)
                    VStack(alignment: .leading) {
                        Text("Ingredients:")
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(.gray)
                            .fontWeight(.regular)
                        
                        ForEach(item.ingredients) { ingredient in
                            Text("• \(ingredient.userFriendlyName).")
                                .font(.custom("Futura", size: 16))
                                .padding(.top, 5)
                                
                                
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
    }
    
    init(item: MenuItem) {
        self.item = item
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailView(item: .init(id: "12", price: 12.4, name: "Some Name", menuCategory: .dessert, imageName: "couscous", ordersCount: 12, ingredients: [.semoulina,.almondsPaste]))
    }
}
