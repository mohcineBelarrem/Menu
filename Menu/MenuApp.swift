//
//  MenuApp.swift
//  Menu
//
//  Created by Mohcine on 22/12/2023.
//

import SwiftUI

@main
struct MenuApp: App {
    @AppStorage("didLaunchBefore") var didLaunchBefore: Bool = false
    var body: some Scene {
        WindowGroup {
            if didLaunchBefore {
                ContentView()
            } else {
                WelcomeView()
            }
        }
    }
}
