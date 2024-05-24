//
//  Timer.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-20.
//

import SwiftUI
import AVFoundation
import UserNotifications

enum Time: String, CaseIterable, Identifiable {
    case seconds, minutes, hours
    
    var id: String {self.rawValue}
}

struct TimerView: View {
    @EnvironmentObject var color: ColorViewModel
    @EnvironmentObject var globalSettings: GlobalSettings
    @State var timeRemaining: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var selectedItem: Time = .seconds
    @State private var selectedHours: Int = 0
    @State private var selectedMinutes: Int = 0
    @State private var selectedSeconds: Int = 0
    @State private var isPaused: Bool = true
    @State private var isPlaying: Bool = false
    @State private var initialTime: Int = 0
    private var player: AVAudioPlayer!
    
    init() {
        // Load sound file
        if let soundURL = Bundle.main.url(forResource: "endTimer", withExtension: "mp3") {
            do {
                self.player = try AVAudioPlayer(contentsOf: soundURL)
                self.player.prepareToPlay()
            } catch {
                print("Error loading sound file:", error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Picker("Amount of time needed..", selection: $selectedHours) {
                    ForEach(0..<24) { hours in
                        Text("\(hours)").tag(hours)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Text("Hours")
                
                Picker("Amount of time needed..", selection: $selectedMinutes) {
                    ForEach(0..<60) { minutes in
                        Text("\(minutes)").tag(minutes)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Text("Min.")
                
                Picker("Amount of time needed..", selection: $selectedSeconds) {
                    ForEach(0..<60) { seconds in
                        Text("\(seconds)").tag(seconds)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Text("Sec.")
                
            }
            .padding()
            .onChange(of: selectedHours) { _ in resetTimer()
                isPaused = true
            }
            .onChange(of: selectedMinutes) { _ in resetTimer()
                isPaused = true
            }
            .onChange(of: selectedSeconds) { _ in resetTimer()
                isPaused = true
            }
            
            Text("\(timeRemainingString)")
                .font(.title)
                .onChange(of: selectedItem) { _ in
                    timeRemaining = 0
                }
                .onReceive(timer) { _ in
                    if !isPaused && timeRemaining > 0 {
                        timeRemaining -= 1
                        if timeRemaining == 0 {
                            player.play()
                            isPlaying = true
                            isPaused = true
                            handleTimerCompletion()
                        }
                    }
                }
            
            HStack {
                Spacer()
                
                Button {
                    startTimer()
                } label: {
                    Text("Start timer")
                }
                
                Spacer()
                
                Button {
                    if timeRemaining > 0 {
                        isPaused.toggle()
                    }
                } label: {
                    Text(isPaused ? "Resume timer" : "Pause timer")
                }
                
                Spacer()
                
                Button {
                    resetTimer()
                    isPaused = false
                } label: {
                    Text("Reset timer")
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            if isPlaying {
                Button {
                    player.stop()
                    isPlaying = false
                } label: {
                    Text("Stop alarm")
                        .font(.title2)
                        .foregroundStyle(Color("textColor"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(color.selectedColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
            } else {
                EmptyView()
            }
        }
        .tint(color.selectedColor)
    }
    
    private var buttonLabel: String {
        if timeRemaining == 0 {
            return "Start Timer"
        } else if isPaused {
            return "Resume Timer"
        } else {
            return "Pause Timer"
        }
    }
    
    private var timeRemainingString: String {
        let hours = timeRemaining / 3600
        let minutes = (timeRemaining % 3600) / 60
        let seconds = timeRemaining % 60
        return hours >= 1 ? String(format: "%02d:%02d:%02d", hours, minutes, seconds) : String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        player.currentTime = 0
        initialTime = selectedHours * 3600 + selectedMinutes * 60 + selectedSeconds
        timeRemaining = initialTime
        isPaused = false
        if timeRemaining == 0 {
            isPaused = true
        } else {
            // Pause or resume the timer
            isPaused = false
        }
    }
    
    private func resetTimer() {
        initialTime = selectedHours * 3600 + selectedMinutes * 60 + selectedSeconds
        timeRemaining = initialTime
        isPlaying = false
        player.stop()
        player.currentTime = 0
        player.prepareToPlay()
    }
    
    private func handleTimerCompletion() {
        if timeRemaining == 0 && globalSettings.notificationsEnabled {
            // Schedule local notification to play sound
            let content = UNMutableNotificationContent()
            content.title = "The Timer Has Finished"
            content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "endTimer.mp3"))
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
            let request = UNNotificationRequest(identifier: "timerFinished", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    TimerView()
        .environmentObject(ColorViewModel())
}
