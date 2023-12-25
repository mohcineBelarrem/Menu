//
//  MenuItem.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import Foundation

protocol MenuItemProtocol: Identifiable, Decodable {
    var id: String { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var imageName: String { get }
    var ordersCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}


struct MenuItem: MenuItemProtocol {
    let id: String
    let price: Double
    let title: String
    let menuCategory: MenuCategory
    let imageName: String
    var ordersCount: Int
    var ingredients: [Ingredient]
}


extension MenuItem {
    enum CodingKeys: String, CodingKey {
        case id
        case price
        case title
        case menuCategory
        case imageName
        case ordersCount
        case ingredients
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = UUID().uuidString
        self.price = try values.decode(Double.self, forKey: .price)
        self.title = try values.decode(String.self, forKey: .title)
        self.imageName = try values.decode(String.self, forKey: .imageName)
        self.ordersCount = try values.decode(Int.self, forKey: .ordersCount)
        
        let stringMenuCategory = try values.decode(String.self, forKey: .menuCategory)
        self.menuCategory = MenuCategory(rawValue: stringMenuCategory) ?? .food
        
        let ingredients = try values.decode([String].self, forKey: .ingredients)
        self.ingredients = ingredients.compactMap { Ingredient(rawValue: $0) }
    }
}
