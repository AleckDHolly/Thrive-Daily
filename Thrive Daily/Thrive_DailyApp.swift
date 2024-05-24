//
//  Thrive_DailyApp.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-15.
//

import SwiftUI

@main
struct Thrive_DailyApp: App {
    @StateObject private var color = ColorViewModel()
    @StateObject private var quoteFetcher = QuoteFetcher()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(color)
                .environmentObject(quoteFetcher)
        }
    }
}
