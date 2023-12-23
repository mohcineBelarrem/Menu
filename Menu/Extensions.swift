//
//  Extensions.swift
//  Menu
//
//  Created by Mohcine BELARREM on 23/12/2023.
//

import SwiftUI
import Foundation


extension Color {
    static var littleOrange: Color {
        return .init(red: 247.0/255.0, green: 199.0/255.0, blue: 121.0/255.0)
    }
    
    static var gray1: Color {
        return .init(red: 237.0/255.0, green: 234.0/255.0, blue: 233.0/255.0)
    }
}


extension Double {
    var withDollars: String {
        return  String(format: "$%.2f", self)
    }
}
