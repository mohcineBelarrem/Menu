//
//  MenuItemModel.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import Foundation

enum SortingType {
    case alphabetical
    case byPopularity
    case byPrice
}

class MenuViewModel: ObservableObject {
    @Published private var menuItems: [MenuItem]
    @Published private var excludedCategories: [MenuCategory] = []
    @Published private var sortingType: SortingType = .alphabetical
    
    var availableMenuCatergories: [MenuCategory] {
        return MenuCategory.allCases.filter { !excludedCategories.contains($0) }
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
    
    func isCateoryAvailable(_ category: MenuCategory) -> Bool {
        return excludedCategories.filter { $0.rawValue == category.rawValue }.isEmpty
    }
    
    func toggleCategory(_ category: MenuCategory) {
        if isCateoryAvailable(category) {
            excludedCategories.append(category)
        } else {
            excludedCategories = excludedCategories.filter { $0.rawValue != category.rawValue }
        }
    }
    
    func applySortingType(_ sortingType: SortingType) {
        self.sortingType = sortingType
    }
    
    func isSortingType(_ sortingType: SortingType) -> Bool {
        return self.sortingType == sortingType
    }
    
    func items(for category: MenuCategory) -> [MenuItem] {
        
        let sortingClosure: (MenuItem, MenuItem) -> Bool
        
        switch sortingType {
        case .alphabetical:
            sortingClosure = { (item1, item2) in return item1.name < item2.name }
        case .byPopularity:
            sortingClosure = { (item1, item2) in return item1.ordersCount > item2.ordersCount }
        case .byPrice:
            sortingClosure = { (item1, item2) in return item1.price < item2.price }
        }
        
        return menuItems.filter { $0.menuCategory == category }.sorted(by: sortingClosure)
    }
}
