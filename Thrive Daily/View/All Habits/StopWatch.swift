//
//  StopWatch.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-20.
//

import SwiftUI

struct StopWatch: View {
    @EnvironmentObject var color: ColorViewModel
    @State var timeElapsed: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack(spacing: 60) {
            Text("\(timeElapsedString)")
                .font(.title)
                .onReceive(timer) { _ in
                    if isRunning {
                        timeElapsed += 1
                    }
                }
            
            HStack {
                Spacer()
                
                Button(action: startStopwatch) {
                    Text(isRunning ? "Pause" : timeElapsed > 0 ? "Resume" : "Start")
                }
                
                Spacer()
                
                Button(action: resetStopwatch) {
                    Text("Reset")
                }
                
                Spacer()
            }
        }
        .padding(.top, 60)
        .tint(color.selectedColor)
    }
    
    private func startStopwatch() {
        isRunning.toggle()
    }
    
    private func resetStopwatch() {
        timeElapsed = 0
        isRunning = false
    }
    
    private var timeElapsedString: String {
        let hours = timeElapsed / 3600
        let minutes = (timeElapsed % 3600) / 60
        let seconds = timeElapsed % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    StopWatch()
        .environmentObject(ColorViewModel())
}
