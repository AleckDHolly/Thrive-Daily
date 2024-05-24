//
//  JournalHelp.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-18.
//

import SwiftUI

struct JournalHelp: View {
    @State private var showingPopover: Bool = false
    @State private var selectedEmotion: Emotions?
    let emotions: [Emotions] = Emotions.allCases
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 80), spacing: 20)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("How are you feeling today?")
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(emotions) { emotion in
                    Button {
                        selectedEmotion = emotion
                        showingPopover.toggle()
                    } label: {
                        VStack {
                            Text(emotion.emoji)
                                .font(.largeTitle)
                            Text(emotion.emotion)
                                .font(.caption)
                                .foregroundStyle(Color("textColor"))
                        }
                    }
                    .sheet(isPresented: Binding(
                        get: { selectedEmotion == emotion },
                        set: { _ in selectedEmotion = nil }
                    )) {
                        HelpQuestionView(emotion: emotion)
                            .presentationDetents([.fraction(0.3)])
                    }
                }
            }
            
            Spacer()
        }
        .font(.title)
    }
}


#Preview {
    JournalHelp()
}
