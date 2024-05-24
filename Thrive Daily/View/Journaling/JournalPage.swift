//
//  JournalPage.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-19.
//

import SwiftUI
import SwiftSpeech
import AVFoundation
import Speech

struct JournalPage: View {
    @AppStorage("localeIdentifier") private var localeIdentifier: String = Locale.autoupdatingCurrent.identifier
    @State var locale: Locale
    
    @State private var showSheet: Bool = false
    @State private var previousTranscript = ""
    @State private var text = ""
    @StateObject private var microphoneAccess = MicrophoneAccess()
    @AppStorage("hold_to_speak") var holdToSpeak: Bool = true
    @AppStorage("show_speaker") var showSpeaker: Bool = true
    
    
    @EnvironmentObject var color: ColorViewModel
    
    enum Field {
        case myField
    }
    @FocusState private var focusedField: Field?
    
    public init(locale: Locale = .autoupdatingCurrent) {
        self._locale = State(initialValue: Locale(identifier: UserDefaults.standard.string(forKey: "localeIdentifier") ?? locale.identifier))
    }
    
    public init(localeIdentifier: String) {
        self._locale = State(initialValue: Locale(identifier: localeIdentifier))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                TextEditor(text: $previousTranscript)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                if showSpeaker {
                    if microphoneAccess.microphoneAccessGranted && microphoneAccess.speechRecognitionAccessGranted {
                        VStack(spacing: 30) {
                            Button {
                                holdToSpeak.toggle()
                            } label: {
                                Text(holdToSpeak ? "Tap to speak.." : "Hold to speak..")
                            }
                            
                            Text(text.isEmpty ? holdToSpeak ? "Hold to speak.." : "Tap to speak.." : text)
                                .font(.title2)
                                .bold()
                                .padding(.horizontal)
                        }
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                        
                        
                        SwiftSpeech.RecordButton()
                            .accentColor(color.selectedColor)
                            .speechModifier(locale: self.locale, holdToSpeak: holdToSpeak)
                            .onRecognizeLatest(handleResult: { result in
                                // Use optional chaining directly in string interpolation
                                let newTranscript = result.bestTranscription.formattedString
                                if result.isFinal {
                                    self.previousTranscript += "\(newTranscript). "
                                    self.text = ""
                                } else {
                                    self.text = newTranscript
                                }
                            }, handleError: { error in
                                // Handle the error appropriately, such as logging or displaying a message
                                print("Error occurred during speech recognition:", error.localizedDescription)
                            })
                    }
                } else {
                    VStack {
                        if !microphoneAccess.speechRecognitionAccessGranted {
                            Button("Grant Speech Recognition Access") {
                                requestSpeechRecognitionAccess { granted in
                                    microphoneAccess.speechRecognitionAccessGranted = granted
                                }
                            }
                        }
                        if !microphoneAccess.microphoneAccessGranted {
                            Button("Grant Microphone Access") {
                                requestMicrophoneAccess { granted in
                                    microphoneAccess.microphoneAccessGranted = granted
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Languages") {
                        Button("English") {
                            changeLanguage(lang: "en-US")
                        }
                        Button("Français") {
                            changeLanguage(lang: "fr-CA")
                        }
                        Button("Español") {
                            changeLanguage(lang: "es-419")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                TabView {
                    JournalHelp()
                    Button {
                        showSpeaker.toggle()
                    } label: {
                        Text(showSpeaker ? "Disable recording.." : "Allow recording")
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
                
            }
        }
    }
    
    func requestSpeechRecognitionAccess(completion: @escaping (Bool) -> Void) {
            SFSpeechRecognizer.requestAuthorization { authStatus in
                DispatchQueue.main.async {
                    completion(authStatus == .authorized)
                }
            }
        }
    
    func requestMicrophoneAccess(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func changeLanguage(lang: String) {
        locale = Locale(identifier: lang)
        localeIdentifier = lang
    }
}

#Preview {
    JournalPage()
        .environmentObject(ColorViewModel())
}
