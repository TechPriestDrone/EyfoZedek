//
//  EyfoZedekApp.swift
//  EyfoZedek
//
//  Created by Andrey Safronov on 30/01/2024.
//

import SwiftUI

@main
struct EyfoZedekApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mainViewModel: MainViewModel())
        }
    }
}
