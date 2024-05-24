//
//  HabitsPage.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-20.
//

import SwiftUI

struct HabitsPage: View {
    @State var list: [String]
    let title: String
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(list, id: \.self) { item in
                    HabitsItem(item: item)
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    HabitsPage(list: ["Test to see if a lot of text will still look good", "Something else"], title: "Test Again")
}
