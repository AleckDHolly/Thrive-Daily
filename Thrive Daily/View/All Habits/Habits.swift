//
//  Habits.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI

struct Habits: View {
    let habitsFrequency: [String] = ["Daily", "Weekly", "Monthly", "Yearly"]
    
    var body: some View {
        NavigationStack {
                List {
                    Section {
                        ForEach(habitsFrequency, id: \.self) { frequency in
                            NavigationLink(destination: HabitsPage(list: ["1", "2", "3", "4", "5"], title: frequency)) {
                                Text("\(frequency) habits")
                            }
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: Pomodoro()) {
                            Text("Timer / Stopwatch")
                        }
                    }
                    
                }
                .modifier(DismissButton())
                .navigationTitle("Habits")
                .navigationBarTitleDisplayMode(.inline)
            }
    }
}

#Preview {
    Habits()
}
