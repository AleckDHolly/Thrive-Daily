//
//  DismissButton.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-17.
//

import SwiftUI
import SwiftSpeech

struct DismissButton: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.title)
                            .foregroundStyle(Color("textColor"))
                    }
                }
            }
    }
}

struct QuoteBackground: ViewModifier {
    @EnvironmentObject var color: ColorViewModel
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(color.selectedColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .shadow(color: .primary.opacity(0.5), radius: 5, x: 5, y: 5)
    }
}

struct BottomBar: ViewModifier {
    let count: Int
    let category: String
    var buttonUse: ()
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(count) \(category)")
                    Spacer()
                    Button {
                        buttonUse
                    } label: {
                        Image(systemName: "folder.badge.plus")
                            .foregroundStyle(Color("textColor"))
                    }
                }
            }
    }
}

struct HoldToSpeak: ViewModifier {
    var locale: Locale
    
    func body(content: Content) -> some View {
        content
            .swiftSpeechRecordOnHold(locale: self.locale, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct TapToSpeak: ViewModifier {
    var locale: Locale
    
    func body(content: Content) -> some View {
        content
            .swiftSpeechToggleRecordingOnTap(locale: self.locale, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
    }
}

extension View {
    @ViewBuilder
    func speechModifier(locale: Locale, holdToSpeak: Bool) -> some View {
        if holdToSpeak {
            self.modifier(HoldToSpeak(locale: locale))
        } else {
            self.modifier(TapToSpeak(locale: locale))
        }
    }
}

