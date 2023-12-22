//
//  MenuItemsView.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var model = MenuModel()
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                GradientBackgroundView()
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading) {
                        LazyVGrid(
                            columns: columns,
                            alignment: .leading,
                            spacing: 16
                        ) {
                            ForEach(model.availableMenuCatergories) { category in
                                Section(header: Text(category.userFriendlyName).font(.largeTitle)) {
                                    //TODO: Beautify title
                                    ForEach(model.items(for: category)) { menuItem in
                                        NavigationLink(destination: Text(menuItem.name)) {
                                            MenuItemGridView(item: menuItem)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Menu")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button {
                            //TODO: Implement me
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                    .padding(20)
                }
            }
        }
        .foregroundColor(.black)
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}


extension Color {
    static var littleOrange: Color {
        return .init(red: 247.0/255.0, green: 199.0/255.0, blue: 121.0/255.0)
    }
}
