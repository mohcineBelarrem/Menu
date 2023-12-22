//
//  MenuItemModel.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import Foundation


class MenuModel: ObservableObject {
    @Published private var menuItems: [MenuItem]
    
    var availableMenuCatergories: [MenuCategory] {
        //TODO: Apply filters
        return MenuCategory.allCases
    }
    
    init() {
        guard let bundlePath = Bundle.main.path(forResource: "menuItems", ofType: "json"),
              let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
              let menuItemsArray = try? JSONDecoder().decode([MenuItem].self, from: jsonData) else {
            self.menuItems = []
            return
        }
        
        self.menuItems = menuItemsArray
    }
    
    func items(for category: MenuCategory) -> [MenuItem] {
        //TODO: Apply Sorting Mechanism
        return menuItems.filter { $0.menuCategory == category }
    }
}
