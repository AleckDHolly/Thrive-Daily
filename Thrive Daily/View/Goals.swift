//
//  Goals.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Goals: View {
    var body: some View {
        NavigationStack {
            Text("Goals")
                .modifier(DismissButton())
        }
    }
}

#Preview {
    Goals()
}
