//
//  MenuItemsView.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewModel()
    @State var showingMenuOptions = false
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        //GridItem(.flexible(), spacing: 16),
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
                            ForEach(viewModel.availableMenuCatergories) { category in
                                Section(header: Text(category.userFriendlyName)
                                    .font(.custom("Futura", size: 25))
                                    .fontWeight(.ultraLight)
                                ) {
                                    ForEach(viewModel.items(for: category)) { menuItem in
                                        NavigationLink(destination: MenuItemDetailView(item: menuItem)) {
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
                            self.showingMenuOptions = true
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                    }
                    .padding(20)
                }
            }
        }
        .sheet(isPresented: $showingMenuOptions, onDismiss: {
            showingMenuOptions = false
        }) {
            MenuOptionsView(isPresented: $showingMenuOptions)
        }
        .foregroundColor(.black)
        .environmentObject(viewModel)
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}


