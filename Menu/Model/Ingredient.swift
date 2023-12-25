//
//  Ingredient.swift
//  Menu
//
//  Created by Mohcine on 25/12/2023.
//

import Foundation

enum Ingredient: String, Identifiable {
    case tomato
    case tomatoSauce
    case carrot
    case pasta
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
    
    var id: String {
        return self.rawValue
    }
    
    var userFriendlyName: String {
        switch self {
        case .tomatoSauce:
            return "Tomato Suace"
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
