//
//  Journal.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Journal: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: JournalPage()) {
                    Text("Test")
                }
            }
            .modifier(DismissButton())
            .modifier(BottomBar(count: 0, category: "Journal Entries"))
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    Journal()
}
