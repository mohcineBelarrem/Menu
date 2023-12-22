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
    case orange
    case safran
    case sugar
    case chicken
    case chickpea
    case potato
    case honey
    case orangeBlossomWater
    case mint
    case coffee
    case greenTea
    case semoulina
    case courgette
    case pumpkin
    case eggplant
    case weirdStuff
    case water
    case lemon
    case almondsPaste
    case pastillaSheet
    case fish
    case onions
    case vermicelli
    case ice
    case strawberry
    case milk
    case chocolate
    case butterMilk
    case sesameSeeds
    
    var userFriendlyName: String {
        switch self {
        case .driedPrunes:
            return "Dried Prunes"
        case .friedAlmonds:
            return "Fried Almonds"
        case .orangeBlossomWater:
            return "Orange Blossom Water"
        case .weirdStuff:
            return "Preservatifs and stuff like that"
        case .almondsPaste:
            return "Alomnds Paste"
        case .pastillaSheet:
            return "Pastilla sheet"
        case .sesameSeeds:
            return "Sesame seeds"
        case .butterMilk:
            return "Butter Milk"
        default:
            return self.rawValue.capitalized
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
