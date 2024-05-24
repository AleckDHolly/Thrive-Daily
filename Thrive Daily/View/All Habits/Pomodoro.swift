//
//  Pomodoro.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-20.
//

import SwiftUI

struct Pomodoro: View {
    @State private var selectedItem = 0
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Type of timer", selection: $selectedItem) {
                    Text("Timer").tag(0)
                    Text("StopWatch").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if selectedItem == 0 {
                    TimerView()
                } else {
                    StopWatch()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                Text("Go to settings and turn on notifications in order to get notified when the timer ends.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .presentationDetents([.fraction(0.2)])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    Pomodoro()
        .environmentObject(ColorViewModel())
}
