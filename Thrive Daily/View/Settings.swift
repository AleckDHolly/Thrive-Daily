//
//  Settings.swift
//  DailyThrive
//
//  Created by Aleck Holly on 2024-05-13.
//

import SwiftUI
import UserNotifications

struct Settings: View {
    @EnvironmentObject var color: ColorViewModel
    @EnvironmentObject var globalSettings: GlobalSettings
    @State private var notificationGranted = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                ColorPicker("Global color", selection: $color.selectedColor)
                    .padding(.top, 40)
                
                Toggle("Notifications", isOn: $globalSettings.notificationsEnabled)
                    .tint(color.selectedColor)
                    .onChange(of: globalSettings.notificationsEnabled) {
                        newValue in
                        checkNotificationSettings()
                        if newValue {
                            requestNotificationPermissions()
                        } else {
                            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        }
                    }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .font(.title2)
            .modifier(DismissButton())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
    
    private func requestNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    globalSettings.notificationsEnabled = true
                } else {
                    if let error = error {
                        print("Notification permission error: \(error.localizedDescription)")
                    }
                    globalSettings.notificationsEnabled = false
                }
            }
        }
    }
    
    private func checkNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationGranted = settings.authorizationStatus == .authorized
                if globalSettings.notificationsEnabled && !self.notificationGranted {
                    globalSettings.notificationsEnabled = false
                }
            }
        }
    }
}

#Preview {
    Settings()
        .environmentObject(ColorViewModel())
        .environmentObject(GlobalSettings())
}
