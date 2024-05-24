//
//  MicrophoneAccess.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-19.
//

import Foundation
import Speech

class MicrophoneAccess: ObservableObject {
    @Published var speechRecognitionAccessGranted = false
    @Published var microphoneAccessGranted = false
    
    init() {
        requestMicrophoneAccess()
        requestSpeechRecognitionAccess()
    }
    
    func requestSpeechRecognitionAccess() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                self.speechRecognitionAccessGranted = authStatus == .authorized
            }
        }
    }
    
    func requestMicrophoneAccess() {
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            DispatchQueue.main.async {
                self.microphoneAccessGranted = granted
            }
        }
    }
}
