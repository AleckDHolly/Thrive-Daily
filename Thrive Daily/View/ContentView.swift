//
//  ContentView.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-15.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("first_time") var firstTime: Bool = true
    
    var body: some View {
        if firstTime {
            Introduction()
        } else {
           HomePage()
                .environmentObject(GlobalSettings())
        }
    }
}

#Preview {
    ContentView()
}
