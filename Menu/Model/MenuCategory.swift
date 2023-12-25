//
//  MenuCategory.swift
//  Menu
//
//  Created by Mohcine on 25/12/2023.
//

import Foundation

enum MenuCategory: String, CaseIterable, Identifiable {
    case food
    case drink
    case dessert
    
    var id: String {
        return self.rawValue
    }
    
    var userFriendlyName: String {
        return self.rawValue.capitalized
    }
}
