//
//  Favourites.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Favourites: View {
    var body: some View {
        NavigationStack {
            Text("Favourites")
                .modifier(DismissButton())
        }
    }
}

#Preview {
    Favourites()
}
