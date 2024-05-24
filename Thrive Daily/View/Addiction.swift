//
//  Addiction.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Addiction: View {
    var body: some View {
        NavigationStack {
            Text("Addiction(s)")
                .modifier(DismissButton())
        }
    }
}

#Preview {
    Addiction()
}
