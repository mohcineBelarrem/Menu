//
//  MenuOptionsView.swift
//  Menu
//
//  Created by Mohcine BELARREM on 23/12/2023.
//

import SwiftUI

struct MenuOptionsView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var viewModel: MenuViewModel
    var body: some View {
        NavigationStack {
            List {
                Section("Categories") {
                    ForEach(MenuCategory.allCases) { category in
                        switch category {
                            
                        case .dessert:
                            MenuOptionView(imageName: "takeoutbag.and.cup.and.straw.fill", optionName: "Dessert", isSelected: viewModel.isCateoryAvailable(.dessert)) {
                                viewModel.toggleCategory(.dessert)
                            }
                        case .food:
                            MenuOptionView(imageName: "fork.knife", optionName: "Food", isSelected: viewModel.isCateoryAvailable(.food)) {
                                viewModel.toggleCategory(.food)
                            }
                        case .drink:
                            MenuOptionView(imageName: "cup.and.saucer.fill", optionName: "Drink", isSelected: viewModel.isCateoryAvailable(.drink)) {
                                viewModel.toggleCategory(.drink)
                            }
                        }
                    }
                }
                
                Section("Sort") {
                    MenuOptionView(imageName: "textformat.abc", optionName: "Alphabetically", isSelected: viewModel.isSortingType(.alphabetical)) {
                        viewModel.applySortingType(.alphabetical)
                    }
                    
                    MenuOptionView(imageName: "dollarsign.circle", optionName: "Price", isSelected: viewModel.isSortingType(.byPrice)) {
                        viewModel.applySortingType(.byPrice)
                    }
                    
                    MenuOptionView(imageName: "chart.line.uptrend.xyaxis", optionName: "Most Popular", isSelected: viewModel.isSortingType(.byPopularity)) {
                        viewModel.applySortingType(.byPopularity)
                    }
                }
            }
                .navigationTitle("Menu Options")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Done") {
                        isPresented = false
                    }
                }
        }
    }
}

struct MenuOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionsView(isPresented: .constant(true))
            .environmentObject(MenuViewModel())
    }
}
