//
//  MenuItem.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import Foundation

enum MenuCategory: String, CaseIterable {
    case food
    case drink
    case dessert
    
    var userFriendlyName: String {
        return self.rawValue.capitalized
    }
}

enum Ingredient: String {
    case tomato
    case lamb
    case driedPrunes
    case friedAlmonds
    case safran
    case sugar
    case honey
    case orangeBlossomWater
    
    var userFriendlyName: String {
        switch self {
        case .tomato:
            return "Tomato"
        case .lamb:
            return "Lamb"
        case .driedPrunes:
            return "Dried Prunes"
        case .friedAlmonds:
            return "Fried Almonds"
        case .safran:
            return "Safran"
        case .sugar:
            return "Sugar"
        case .honey:
            return "Honey"
        case .orangeBlossomWater:
            return "Orange Blossom Water"
        }
    }
}

protocol MenuItemProtocol: Identifiable, Decodable {
    var id: String { get }
    var price: Double { get }
    var name: String { get } // name is better than title.
    var menuCategory: MenuCategory { get }
    var imageName: String? { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}


struct MenuItem: MenuItemProtocol {
    let id: String
    let price: Double
    let name: String
    let menuCategory: MenuCategory
    let imageName: String?
    var ordersCount: Int
    var ingredients: [Ingredient]
}


extension MenuItem {
    enum CodingKeys: String, CodingKey {
        case id
        case price
        case name
        case menuCategory
        case imageName
        case ordersCount
        case ingredients
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID().uuidString
        self.price = try values.decode(Double.self, forKey: .price)
        self.name = try values.decode(String.self, forKey: .name)
        self.imageName = try? values.decode(String.self, forKey: .imageName)
        self.ordersCount = try values.decode(Int.self, forKey: .ordersCount)
        
        let stringMenuCategory = try values.decode(String.self, forKey: .menuCategory)
        self.menuCategory = MenuCategory(rawValue: stringMenuCategory) ?? .food
        
        let ingredients = try values.decode([String].self, forKey: .ingredients)
        self.ingredients = ingredients.compactMap { Ingredient(rawValue: $0) }
    }
}
