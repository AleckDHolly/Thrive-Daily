//
//  HelpQuestionView.swift
//  Thrive Daily
//
//  Created by Aleck Holly on 2024-05-18.
//

import SwiftUI

struct HelpQuestionView: View {
    let emotion: Emotions
    
    var body: some View {
            TabView {
                ForEach(emotion.questions, id: \.self) { emotion in
                    Text(emotion)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    
}

#Preview {
    HelpQuestionView(emotion: .sadness)
}
