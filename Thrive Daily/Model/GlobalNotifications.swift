//
//  GlobalNotifications.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-22.
//

import Foundation
import SwiftUI

class GlobalSettings: ObservableObject {
    @AppStorage("notificationsEnabled") var notificationsEnabled: Bool = false
}
